import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item{
    id: keyItem
    function check(){
        return keyItem.currentKey===keyItem.question.key
    }
    function getAnswer(correct){
        return "<font color=\""+(correct?"green":"red")+"\">"+keyItem.question.answers[keyItem.question.key]+"</font>"
    }
    
    property bool canCheck: currentKey>=0 && currentKey<question.answers.length
    property var question
    property int currentKey: -1
    ColumnLayout{
        width: Math.min(keyItem.width-Material.frameVerticalPadding*2,implicitWidth)
        height: implicitHeight
        anchors.centerIn: parent
        Label{
            text: keyItem.question.question
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Item{
            ButtonGroup{id: radioGroup}
            width: buttonsColumn.implicitWidth
            height: buttonsColumn.implicitHeight
            Layout.alignment: Qt.AlignHCenter
            ColumnLayout{
                id: buttonsColumn
                Repeater{
                    model: keyItem.question.answers
                    RadioButton{
                        text: modelData
                        Layout.fillWidth: true
                        ButtonGroup.group: radioGroup
                        onCheckedChanged: if(checked) currentKey=index
                    }
                }
            }
        }
    }
}
