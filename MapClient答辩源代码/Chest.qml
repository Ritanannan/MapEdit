import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0
import QtQml 2.2

Entity {
    id: root

    property string name: "entity"
    property real x: 0
    property real y: 0
    property real z: 0
    property real scale: 1.0

    signal mouseClicked()

    RenderableEntity {
        id: chest
        source: "qrc:/chest/Chest.obj"
        position: Qt.vector3d(root.x, root.y, root.z)
        scale: 0.03 * root.scale

        material: DiffuseMapMaterial {
            id: material
            diffuse: "qrc:/chest/diffuse.webp"
            specular: Qt.rgba( 0.2, 0.2, 0.2, 1.0 )
            shininess: 2.0
        }

    }

    Connections {
        target: chest
        onMouseClicked: root.mouseClicked()
    }
}
