import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item{
    id: keyItem
    function check(){
        return keyItem.currentKey===keyItem.question.key
    }
    
    property bool canCheck: currentKey>=0 && currentKey<question.answers.length
    property var question
    property bool checked: false
    property bool correct: false
    property int currentKey: -1
    ColumnLayout{
        width: parent.width
        height: implicitHeight
        anchors.centerIn: parent
        Label{
            text: keyItem.question.question
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Item{
            visible: !checked
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
        Label{
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            visible: checked
            color: correct?"green":"red"
            text: keyItem.question.answers[keyItem.question.key]
        }
    }
}
