local Api = require("coreApi")

function ReceiveFriendMsg(CurrentQQ, data) return 1 end
function ReceiveEvents(CurrentQQ, data, extData) return 1 end

function ReceiveEvents(CurrentQQ, data, extData)
    if data.MsgType == "ON_EVENT_GROUP_EXIT" then
        Api.Api_SendMsg(
            CurrentQQ,
            {
                toUser = tonumber(data.FromUin),
                sendToType = 2,
                sendMsgType = "TextMsg",
                groupid = 0,
                content = string.format(
                    '群友【%d】\n[表情107]离开了本群！\n[表情66]请珍惜在一起的每一分钟！',
                    extData.UserID
                ),
                atUser = data.FromUserId
            }
        )
    end
end
