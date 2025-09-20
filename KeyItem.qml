import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item{
    id: keyItem
    function check(){
        return currentAnswer.trim().toLowerCase()===keyItem.question.key.toLowerCase()
    }
    
    property bool canCheck: currentAnswer.trim().length>0

    property var question
    property bool checked: false
    property bool correct: false
    ColumnLayout{
        anchors.fill: parent
        Label{
            text: keyItem.question.rus
            Layout.fillWidth: true
            Layout.fillHeight: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Label{
            Layout.fillWidth: true
            textFormat: Text.StyledText
            text: !checked?keyItem.question.eng:keyItem.question.eng.replace("...","<font color=\""+(correct?"green":"red")+"\">"+keyItem.question.key+"</font>")
        }
    }
}
