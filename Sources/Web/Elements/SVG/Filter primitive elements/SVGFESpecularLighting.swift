//
//  SVGFESpecularLighting.swift
//  Web
//
//  Created by Mihael Isaev on 17.12.2020.
//

import Foundation

/// The <feSpecularLighting> SVG filter primitive lights a source graphic
/// using the alpha channel as a bump map. The resulting image is an RGBA image
/// based on the light color. The lighting calculation follows the standard specular component
/// of the Phong lighting model. The resulting image depends on the light color,
/// light position and surface geometry of the input bump map.
/// The result of the lighting calculation is added.
/// The filter primitive assumes that the viewer is at infinity in the z direction.
///
/// This filter primitive produces an image which contains the specular reflection part
/// of the lighting calculation. Such a map is intended to be combined with a texture
/// using the add term of the arithmetic <feComposite> method.
/// Multiple light sources can be simulated by adding several of these light maps
/// before applying it to the texture image.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feSpecularLighting
open class SVGFESpecularLighting: BaseActiveElement {
    
}
