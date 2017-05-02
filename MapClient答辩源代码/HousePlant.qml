
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0
import QtQml 2.2

Entity {
    id: root

    property string potShape: "cross"
    property string plantType: "bamboo"

    property string name: "entity"
    property real x: 0
    property real y: 0
    property real z: 0
    property real scale: 1.0

    signal mouseClicked()

    RenderableEntity {
        id: pot
        source: "qrc:/houseplants/" + root.potShape + "-pot.obj"
        scale: 0.03 * root.scale
        position: Qt.vector3d(root.x, root.y, root.z)

        material: NormalDiffuseMapMaterial {
            diffuse: "qrc:/houseplants/pot.webp"
            normal: "qrc:/houseplants/pot_normal.webp"
            specular: Qt.rgba( 0.75, 0.75, 0.75, 1.0 )
            shininess: 10.0
        }


        RenderableEntity {
            source: "qrc:/houseplants/" + root.potShape + "-" + root.plantType + ".obj"
            material: NormalDiffuseMapAlphaMaterial {
                diffuse: "qrc:/houseplants/"  + root.plantType + ".webp"
                normal: "qrc:/houseplants/" + root.plantType + "_normal.webp"
                shininess: 10.0
            }
        }

        RenderableEntity {
            source: "qrc:/houseplants/" + root.potShape + "-pot-cover.obj"
            material: NormalDiffuseMapMaterial {
                diffuse: "qrc:/houseplants/cover.webp"
                normal: "qrc:/houseplants/cover_normal.webp"
                specular: Qt.rgba( 0.05, 0.05, 0.05, 1.0 )
                shininess: 5.0
            }
        }
    }

    Connections {
        target: pot
        onMouseClicked: root.mouseClicked()
    }
}
