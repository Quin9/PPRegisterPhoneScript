-- zorro 启动函数
function pConfig:runZorro()
    mSleep(10)
    runApp(bundleID[2]); 
    
    nLog("zooro 运行")
    
    while (true) do
        -- 超时重启脚本函数
        pConfig.timeOut()
        
        local res, code = http.request("http://127.0.0.1:8844/cmd?fun=newrecord");--一键新机
        if res ~= nil then
            res=json.decode(res)  
            toast(res.retcode, 1)
            if res.retcode==1 then
                mSleep(100)
                toast("pp go",1)
                
                local zorroNotConX,zorroNotConY = findImage("img/zorro-notCon.png",13,363,741,1035);
                if zorroNotConX ~= -1 and zorroNotConY ~= -1 then
                    toast("zorro 网络异常")
                    lua_restart()
                end
                
                mSleep(1000)
                
                local res, code = http.request("http://127.0.0.1:8844/cmd?fun=resetlocationbyip");-- 根据ip切换坐标
                if res ~= nil then
                    res=json.decode(res)  
                    
                    if res.retcode==1 then
                        
                        if pConfig.type == "注册7.42.3" or pConfig.type == "注册8.6.1" then
                            pConfig.runPPRegister()
                        elseif  pConfig.type == "领取8.6" then
                            require "pLogin";
                            pConfig.runLogin();
                            
                        end
                        mSleep(10)
                        return true;
                        
                    end
                end
                
                -- 判断是不是 注册 还是 登录
                
                
                
            
            elseif res.retcod == 2 then
                toast("running",1)
            elseif res.retcod == 10 then
                toast("zorro err",0)
            elseif res.retcod == 10 then
                toast("ip问题",1)
            elseif  res.retcod == 100 then
                toast("zorro 到期")
            end
        end
    end


end