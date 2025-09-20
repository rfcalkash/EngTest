import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item{
    id: keyItem
    function check(){
        return currentAnswer.trim().toLowerCase()===ensureString(keyItem.question.key).toLowerCase()
    }

    property bool canCheck: currentAnswer.trim().length>0
    
    property var question
    property bool checked: false
    property bool correct: false
    ColumnLayout{
        anchors.fill: parent
        Label{
            text: keyItem.question.question
            Layout.fillWidth: true
            Layout.fillHeight: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Label{
            Layout.fillWidth: true
            textFormat: Text.StyledText
            text: !checked?"...":keyItem.question.key
            color: checked?(correct?"green":"red"):"black"
        }
    }
}
