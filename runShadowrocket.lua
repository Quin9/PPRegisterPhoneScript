-- 小火箭 启动函数
function pConfig:runShadowrocket()
    mSleep(10)

    mSleep(2000)
    runApp(bundleID[1]);
    
    nLog("Shadowrocket 运行")
    local ip = pConfig.ip;
    local ipID = pConfig.ipID;
    local proxyPUsername = pConfig.proPUsername;
    local proxyPNikename = pConfig.proPNikename;
    local url = "";
    if ip == "proxy" then 
        url = "https://portal.proxyguys.com/proxies/".. ipID .. "/reset"

    elseif ip == "rola" then
        url = "http://refresh.rola.info/refresh?user=" .. ipID .. "&country=us&state=&city=";
        
    elseif ip == "proxyP" then

        -- url = "https://proxypanel.io/proxy/change-ip/hahaha123/proxy1"
        url = "https://proxypanel.io/proxy/change-ip/" .. proxyPUsername .."/".. proxyPNikename .."/".. ipID;
        
        while (true) do
            -- 超时重启脚本函数
            pConfig.timeOut()
        
            local header_send = {
                ["Content-Type"] = "application/x-www-form-urlencoded",
                ["Accept-Encoding"] = "gzip",
                ["typeget"] = "ios"
            }
            local body_send = {}

            local code, header_resp, body_resp = ts.httpsGet(url, header_send, body_send);
            
            if body_resp ~= nil and code == 200 then
                body_resp=json.decode(body_resp)
                -- body_resp=tostring(body_resp)
                dialog(body_resp,2)
                mSleep(10)
                setVPNEnable(true)
                mSleep(3000)
                --关闭 VPN 开关
            
                local flag = getVPNStatus()
                if flag.status == "Connected" then
                
                    -- if res.Ret == "SUCCESS" or res.result ~= nil then 
                    if body_resp.status == "ip changed" then
                    
                        mSleep(10000)
                        toast("zorro go",1)
                        pConfig.runZorro()
                        return true;
                    else 
                        toast("ip切换没成功 请检查相关配置",3)
                    end
                end
            end 
        end
    end
    

    
    while (true) do
        -- 超时重启脚本函数
        pConfig.timeOut()

        -- local res, code = http.request("https://portal.proxyguys.com/proxies/bb3bc32c8969430490a015eeea1f70ea/reset");
        local header_send = {
            ["Content-Type"] = "application/x-www-form-urlencoded",
            ["Accept-Encoding"] = "gzip",
            ["typeget"] = "ios"
        }
        local body_send = {}

        local code, header_resp, body_resp = ts.httpsGet(url, header_send, body_send)

        if body_resp ~= nil and code == 200 then
            -- res=json.decode(res)
            body_resp=tostring(body_resp)
            toast(body_resp)
            mSleep(10)
            setVPNEnable(true)
            mSleep(1000)
            --关闭 VPN 开关
            
            local flag = getVPNStatus()
            if flag.status == "Connected" then
                
                -- if res.Ret == "SUCCESS" or res.result ~= nil then 
                if string.len(body_resp) > 40 then
                    local VpnErrX,VpnErrY = findImage("img/vpn-err.png",117,550,633,776);
                    mSleep(10)
                    if (VpnErrX ~= -1 and VpnErrY ~= -1 )  then 
                        local VpnErrOkX,VpnErrOkY = findImage("img/vpn-err-ok.png",117,550,633,776);
                        mSleep(10)
                        if (VpnErrOkX ~= -1 and VpnErrOkY ~= -1 )  then 
                            tap(VpnErrOkX,VpnErrOkY);
                        end
                    end
                    
                    mSleep(10000)
                    toast("zorro go",1)
                    pConfig.runZorro()
                    return true;
                else 
                    toast("ip切换没成功 请检查相关配置",3)
                end
            end
        end 
    end


end



-- 开始区域找图
-- local vpnOffX,vpnOffY = findImage("vpnOff.png", 560, 105, 744, 374);
-- local vpnOnX,vpnOnY = findImage("vpnOn.png", 560, 105, 744, 374);
-- nLog(vpnOffX .."1" ..  vpnOffY)
-- nLog(vpnOnX.."2"..vpnOnY)
        
-- mSleep(10)
-- if vpnOffX ~= -1 and vpnOffY ~= -1 then 
--     -- vpn是关闭状态
--     tap(vpnOffX,vpnOffY + 20)
--     -- elseif vpnOnX ~= -1 and vpnOnY ~= -1    then 
--     -- vpn 是开始状态
--     toast("wwww111")

-- end



