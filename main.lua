require "TSLib";
require "tsnet";
thread = require('thread')
ts = require "ts";
sz = require "sz";
http = require "szocket.http";
json = ts.json--使用 JSON 模块前必须插入这一句

-- 脚本配置对象
pConfig = {};




--  bundleID 所有应用id 集合
bundleID = require "bundleID";
mSleep(10)
-- 返回 运行小火箭函数
require "runShadowrocket";
mSleep(10)
require "runZorro";
mSleep(10)
require "runPPRegister";
mSleep(10)
-- config返回一个pConfig 对象 里面是脚本配置参数
-- config返回runPPRegister 脚本运行函数
require "config";
mSleep(10)
-- 工程函数
require "FactoryFunction";


-- dialog(pConfig.ip .. pConfig.ipID ..  pConfig.EmailRight)

-- 杀掉所有 app
function pConfig:killAllApp()
    for i,v in ipairs(bundleID) do
        -- nLog(v .. i)
        closeApp(v)
        mSleep(1000)
    end
end

pConfig.killAllApp()


function pConfig:goPaypal()
    -- 运行脚本的时候 记录当时时间戳当作定时器  每个运行函数中调用 timeout方法 来获取当前超时时间
    start = os.time()
    setVPNEnable(false)
    -- 传入 脚本 ip 和 uuid 参数
    runningBool =  pConfig.runShadowrocket();
    
    mSleep(1000)
    -- dialog(allTime)
    if runningBool == true then 
        -- 清理缓存
        os.execute("su mobile -c uicache");
        toast("再次运行",3)
        pConfig.killAllApp();
        pConfig:goPaypal();
    end

end

function pConfig:timeOut()
    if os.difftime(os.time(), start) > (tonumber(pConfig.timer) * 60) then
        -- os.execute("su mobile -c uicache");
        -- pConfig.killAllApp();
        -- pConfig:goPaypal();
        toast("超时！ 重新运行",3)
        lua_restart()
    end
end



-- 脚本 UI 界面
pConfig.runPPconfig();
mSleep(10)
-- 脚本启动函数
pConfig.goPaypal();