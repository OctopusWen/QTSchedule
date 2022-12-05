/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick
import QtQuick.Controls
import QTSchedule
import QtQuick.Layouts 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor
    property bool isDialogOpen: false

    Button {
        id: addToDoButton
        y: 644
        text: qsTr("ADD")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10

        Connections {
            target: addToDoButton
            onClicked: rectangle.isDialogOpen = !rectangle.isDialogOpen
        }
    }

    Rectangle {
        id: addToDoDialog
        y: 450
        height: 200
        visible: rectangle.isDialogOpen
        color: "#d6d7d7"
        radius: 30
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: addToDoButton.top
        clip: rectangle.isDialogOpen
        anchors.bottomMargin: 90
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        rotation: 0

        TextField {
            id: toDoTextInput
            height: 60
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.topMargin: 25
            placeholderText: qsTr("Text Field")
        }

        RowLayout {
            y: 134
            height: 48
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            spacing: 10

            Button {
                id: cancelButton
                text: qsTr("cancel")
                Layout.fillWidth: true

                Connections {
                    target: cancelButton
                    onClicked: rectangle.isDialogOpen = false
                }
            }

            Button {
                id: addButton
                text: qsTr("add")
                Layout.fillWidth: true

                Connections {
                    target: addButton
                    onClicked: rectangle.isDialogOpen = false
                }

                Connections {
                    target: addButton
                    onClicked: myListModel.append(myListModel.createListElement())
                }
            }
        }
    }

    Column {
        id: column
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 100
        anchors.topMargin: 50

        Repeater {
            id: repeater
            anchors.fill: parent
            model: ListModel{
                id: myListModel
                ListElement{
                    name: "my todo"
                }
                function createListElement(){
                    return {
                        "name": toDoTextInput.text
                    }
                }
            }

            Rectangle {
                id: toDoItem
                x: 0
                y: -31
                height: 62
                color: "#d6d7d7"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.leftMargin: 10

                CheckBox {
                    id: checkBox
                    text: name
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    font.pointSize: 16
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 6
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:1}D{i:4}D{i:5}D{i:3}D{i:11}
}
##^##*/
