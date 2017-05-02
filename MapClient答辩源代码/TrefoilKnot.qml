import Qt3D.Core 2.0
import Qt3D.Render 2.0

Entity {
    id: root

    property string name: "entity"
    property real x: 0.0
    property real y: 0.0
    property real z: 0.0
    property real scale: 1.0
    property real theta: 0.0
    property real phi: 0.0
    property Material material

    signal mouseClicked()

    components: [ transform, mesh, root.material, picker ]

    Transform {
        id: transform
        translation: Qt.vector3d(root.x, root.y, root.z)
        rotationX: theta
        rotationY: phi
        scale: root.scale
    }

    Mesh {
        id: mesh
        source: "qrc:/trefiolknot/trefoil.obj"
    }

    ObjectPicker {
        id: picker
        onClicked: root.mouseClicked()

    }
}
