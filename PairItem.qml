import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item{
    id: keyItem
    function check(){
        return currentAnswer.trim().toLowerCase()===ensureString(keyItem.question.key).toLowerCase()
    }

    function getAnswer(correct){
        return "<font color=\""+(correct?"green":"red")+"\">"+keyItem.question.key+"</font>"
    }

    property bool canCheck: currentAnswer.trim().length>0
    
    property var question

    Label{
        text: keyItem.question.question
        anchors.centerIn: parent
        width: Math.min(keyItem.width-Material.frameVerticalPadding*2,paintedWidth)
        wrapMode: Text.Wrap
    }
}
