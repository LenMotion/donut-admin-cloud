package cn.lenmotion.donut.system.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.asymmetric.KeyType;
import cn.hutool.crypto.asymmetric.RSA;
import cn.lenmotion.donut.common.excel.ExcelClient;
import cn.lenmotion.donut.system.entity.converter.LogConverter;
import cn.lenmotion.donut.system.entity.dto.StartExportLogDTO;
import cn.lenmotion.donut.system.entity.po.SysLoginLog;
import cn.lenmotion.donut.system.entity.query.LoginLogQuery;
import cn.lenmotion.donut.system.entity.vo.export.LoginLogExportVO;
import cn.lenmotion.donut.system.mapper.SysLoginLogMapper;
import cn.lenmotion.donut.system.service.SysExportLogService;
import cn.lenmotion.donut.system.service.SysLoginLogService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author lenmotion
 */
@Service
@RequiredArgsConstructor
public class SysLoginLogServiceImpl extends ServiceImpl<SysLoginLogMapper, SysLoginLog> implements SysLoginLogService {

    private final SysExportLogService exportLogService;
    private final TaskExecutor taskExecutor;
    private final ExcelClient excelClient;
    private final RSA loginRsa;

    @Override
    public IPage<SysLoginLog> selectPage(LoginLogQuery query) {
        return getBaseMapper().selectPage(query.toPage(), query);
    }

    @Override
    public void exportLog(LoginLogQuery query) {
        var userId = StpUtil.getLoginIdAsLong();
        taskExecutor.execute(() -> {
            var timer = DateUtil.timer();
            var exportLog = exportLogService.startExport(new StartExportLogDTO(userId, "登录日志"));
            var logList = getBaseMapper().selectListByQuery(query);
            var list = LogConverter.INSTANCE.toExportVO(logList);
            excelClient.exportTrans(list, LoginLogExportVO.class, exportLog, timer);
        });
    }

    @Override
    public Map<String, SysLoginLog> selectLoginLogByToken(List<String> tokenValueList) {
        if (CollUtil.isEmpty(tokenValueList)) {
            return new HashMap<>(0);
        }

        List<String> tokens = tokenValueList.stream()
                .map(e -> loginRsa.encryptBase64(StrUtil.split(e, StrUtil.COLON).get(3), KeyType.PrivateKey))
                .toList();
        LambdaQueryWrapper<SysLoginLog> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(SysLoginLog::getTokenValue, tokens);

        var list = super.list(queryWrapper);
        return list.stream().collect(Collectors.toMap(e -> loginRsa.decryptStr(e.getTokenValue(), KeyType.PublicKey), e -> e));
    }

}
