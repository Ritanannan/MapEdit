import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import DesktopControls 0.1

Flickable {
    id: root
    implicitWidth: 800

    implicitHeight: 200

    property var backgroundColor: "lightGrey"
    property alias toolBar: tool
    default property alias dialogContent: container.children
    property var allInfo: []
    property int maxLineCount: 10000

    ToolBar{
        id: tool
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }

        implicitHeight: 27
        background: Rectangle{
            color: backgroundColor
        }
    }
    Item {
        id: container
        anchors{
            top: tool.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        clip: true
    }

    Connections {
        target: _entityBinding
        onRunningInfoChanged:{
            debug(runningInfo)
            information(runningInfo)
            warning(runningInfo)
            error(runningInfo)
        }
    }

    function information(t){
        var tmp = (new Date).toTimeString()+": "+'<span style=" font-size:12pt; color:#424242;">'+t+'</span>'

        if (!showInfo.down) return

        textArea.append(tmp)

        var info = new Object
        info["type"] = 4
        info["text"] = tmp
        allInfo.push(info)
    }

    function debug(d){
        var tmp = (new Date).toTimeString()+": "+'<span style=" font-size:12pt; color:#43a047;">'+d+'</span>'

        textArea.append(tmp)
        var info = new Object
        info["type"] = 0
        info["text"] = tmp
        allInfo.push(info)
    }

    function warning(w){
        var tmp = (new Date).toTimeString()+": "+'<span style=" font-size:12pt; color:#ffa000;">'+w+'</span>'

        if (!showWarning.down) return

        textArea.append(tmp)
        var info = new Object
        info["type"] = 1
        info["text"] = tmp
        allInfo.push(info)
    }

    function error(e){
        var tmp = (new Date).toTimeString()+": "+'<span style=" font-size:12pt; color:#ff5722;">'+e+'</span>'

        if (!showError.down) return

        textArea.append(tmp)
        var info = new Object
        info["type"] = 3
        info["text"] = tmp
        allInfo.push(info)
    }

    function refresh(){
        textArea.clear()
        allInfo.forEach(function(info){
            if ((info.type === 0) ||//debug
                    (info.type === 1 && showWarning.down) |//warning
                    (info.type === 3 && showError.down) |//error
                    (info.type === 4 && showInfo.down)) {//information
                textArea.append(info.text)
            }
        })
    }

    RowLayout{
        parent: root.toolBar
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height
        Label{
            backgroundColor: root.backgroundColor
            text: " 日志"
        }
        Rectangle{
            height: parent.height-6
            color: "black"
            opacity: 0.1
            width: 1
        }

        DesktopToolbarIconButton{
            id: clearBtn
            backgroundColor: root.backgroundColor
            iconSize: 19
            implicitWidth: 27
            implicitHeight: 27
            iconSource: "icon://awesome/eraser"
            iconColor: "black"
            tip: "清空"
            background: Rectangle{
                color: clearBtn.pressed ? Qt.darker(root.backgroundColor, 1.2) :
                                          clearBtn.pressed ? Qt.lighter(root.backgroundColor, 0.8): root.backgroundColor
            }

            onClicked: {
                textArea.clear()
                allInfo.splice(0, allInfo.length)
            }
        }

        DesktopToolbarIconButton{
            id: showInfo
            backgroundColor: root.backgroundColor
            iconSize: 19
            implicitWidth: 27
            implicitHeight: 27
            iconSource: "icon://awesome/info_circle"
            iconColor: "#424242"
            checkable: true
            down: true
            tip: "显示日志信息"
            background: Rectangle{
                color: showInfo.down ? Qt.darker(root.backgroundColor, 1.2) :
                                       showInfo.hovered ? Qt.lighter(root.backgroundColor, 0.8): root.backgroundColor
            }

            onClicked: {
                showInfo.down = !showInfo.down
                refresh()
            }
        }

        DesktopToolbarIconButton{
            id: showWarning
            backgroundColor: root.backgroundColor
            iconSize: 19
            implicitWidth: 27
            implicitHeight: 27
            iconSource: "icon://awesome/exclamation_triangle"
            iconColor: "#ffa000"
            tip: "显示警告信息"
            checkable: true
            down: true
            background: Rectangle{
                color: showWarning.down ? Qt.darker(root.backgroundColor, 1.2) :
                                          showWarning.hovered ? Qt.lighter(root.backgroundColor, 0.8): root.backgroundColor
            }

            onClicked: {
                showWarning.down = !showWarning.down
                refresh()
            }
        }

        Item{ Layout.fillWidth: true }
    }

    Flickable {
        parent: container
        anchors.fill: parent

        TextArea.flickable: TextArea {
            id: textArea
            textFormat: Qt.RichText
            background: Item{}
        }

        ScrollBar.vertical: ScrollBar {
            pressed: true
            onPressedChanged: pressed = true
        }
        ScrollBar.horizontal: ScrollBar {
            pressed: true
            onPressedChanged: pressed = true
        }
    }
}
