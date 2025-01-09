-- pp 启动函数
require "ppRunRegFun";
function pConfig:runPPRegister()
    mSleep(10)
    runApp(bundleID[3]); 
    -- pp 开始注册

    nLog("runPPRegister 运行")
    mSleep(5000)

    -- 第一步 找到注册按钮
    pConfig.ppRegFindSingup()
    mSleep(500)
    -- 第二步  找到电话文本框进行操作 内有voip步骤
    pConfig.ppRegFindPhone()
    mSleep(500)
    -- 第三步 填写ssn
    pConfig.ppRegWriteSSN()
    mSleep(500)
    -- 第四步 填写地址
    pConfig.ppRegWriteStree()
    mSleep(500)
    -- 第五步绑卡后续
    pConfig.ppRegCardNext()
    mSleep(500)
    -- 注册成功
    pConfig.ppRegOk()
    mSleep(500)
    return true;
end