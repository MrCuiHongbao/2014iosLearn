/*
 <codex>
 <abstract>Shows how objects can be shared or unshared depending on specific needs.</abstract>
 </codex>
 */

#import "AAPLPresentationViewController.h"
#import "AAPLSlideTextManager.h"
#import "AAPLSlide.h"
#import "Utils.h"

@interface AAPLSlideCloning : AAPLSlide
@end

@implementation AAPLSlideCloning {
    NSColor *_redColor, *_greenColor, *_blueColor, *_purpleColor;
    SCNNode *_diagramNode;
}

- (NSUInteger)numberOfSteps {
    return 4;
}

- (void)setupSlideWithPresentationViewController:(AAPLPresentationViewController *)presentationViewController {
    _redColor = [NSColor colorWithDeviceRed:168.0 / 255.0 green:21.0 / 255.0 blue:0.0 / 255.0 alpha:1];
    _greenColor = [NSColor colorWithDeviceRed:154.0 / 255.0 green:197.0 / 255.0 blue:58.0 / 255.0 alpha:1];
    _blueColor = [NSColor colorWithDeviceRed:49.0 / 255.0 green:80.0 / 255.0 blue:201 / 255.0 alpha:1];
    _purpleColor = [NSColor colorWithDeviceRed:190.0 / 255.0 green:56.0 / 255.0 blue:243.0 / 255.0 alpha:1];
    
    // Create the diagram but hide it
    _diagramNode = [self cloningDiagramNode];
    _diagramNode.opacity = 0.0;
    [self.contentNode addChildNode:_diagramNode];
}

- (void)didOrderInWithPresentationViewController:(AAPLPresentationViewController *)presentationViewController {
    // Once the slide ordered in, reveal the diagram
    
    for (SCNNode *node in _diagramNode.childNodes)
        node.rotation = SCNVector4Make(0, 1, 0, M_PI_2); // initially viewed from the side
    
    [SCNTransaction begin];
    [SCNTransaction setAnimationDuration:0.75];
    {
        _diagramNode.opacity = 1.0;
        for (SCNNode *node in _diagramNode.childNodes)
            node.rotation = SCNVector4Make(0, 1, 0, 0);
    }
    [SCNTransaction commit];
}

- (void)presentStepIndex:(NSUInteger)index withPresentationViewController:(AAPLPresentationViewController *)presentationViewController {
    switch (index) {
        case 0:
            // Set the slide's title and subtitle and add some text
            self.textManager.title = @"Performance";
            self.textManager.subtitle = @"Copying";
            
            [self.textManager addBullet:@"Attributes are shared by default" atLevel:0];
            [self.textManager addBullet:@"Unshare if needed" atLevel:0];
            [self.textManager addBullet:@"Copying geometries is cheap" atLevel:0];
            
            break;
        case 1:
        {
            // New "Node B" box
            SCNNode *nodeB = [SCNNode asc_boxNodeWithTitle:@"Node B" frame:NSMakeRect(-55, -36, 110, 50) color:_greenColor cornerRadius:10 centered:YES];
            nodeB.name = @"nodeB";
            nodeB.position = SCNVector3Make(140, 0, 0);
            nodeB.opacity = 0;
            
            SCNNode *nodeA = [self.contentNode childNodeWithName:@"nodeA" recursively:YES];
            [nodeA addChildNode:nodeB];
            
            // Arrow from "Root Node" to "Node B"
            SCNNode *arrowNode = [SCNNode node];
            arrowNode.geometry = [SCNShape shapeWithPath:[NSBezierPath asc_arrowBezierPathWithBaseSize:NSMakeSize(140, 3) tipSize:NSMakeSize(10, 14)  hollow:4 twoSides:YES] extrusionDepth:0];
            arrowNode.position = SCNVector3Make(-130, 60, 0);
            arrowNode.rotation = SCNVector4Make(0, 0, 1, -M_PI * 0.12);
            arrowNode.geometry.firstMaterial.diffuse.contents = _greenColor;
            [nodeB addChildNode:arrowNode];
            
            // Arrow from "Node B" to the shared geometry
            arrowNode = [SCNNode node];
            arrowNode.name = @"arrow-shared-geometry";
            arrowNode.geometry = [SCNShape shapeWithPath:[NSBezierPath asc_arrowBezierPathWithBaseSize:NSMakeSize(140, 3) tipSize:NSMakeSize(10, 14)  hollow:4 twoSides:NO] extrusionDepth:0];
            arrowNode.position = SCNVector3Make(0, -28, 0);
            arrowNode.rotation = SCNVector4Make(0, 0, 1, M_PI * 1.12);
            arrowNode.geometry.firstMaterial.diffuse.contents = _purpleColor;
            [nodeB addChildNode:arrowNode];
            
            // Reveal
            [SCNTransaction begin];
            [SCNTransaction setAnimationDuration:1];
            {
                nodeB.opacity = 1.0;
                
                // Show the related code
                [self.textManager addCode:
                 @"// Copy a node \n"
                 @"SCNNode *nodeB = [nodeA #copy#];"];
            }
            [SCNTransaction commit];
            break;
        }
        case 2:
        {
            SCNNode *geometryNodeA = [self.contentNode childNodeWithName:@"geometry" recursively:YES];
            SCNNode *oldArrowNode = [self.contentNode childNodeWithName:@"arrow-shared-geometry" recursively:YES];
            
            // New "Geometry" box
            SCNNode *geometryNodeB = [SCNNode asc_boxNodeWithTitle:@"Geometry" frame:NSMakeRect(-55, -20, 110, 40) color:_purpleColor cornerRadius:10 centered:YES];
            geometryNodeB.position = SCNVector3Make(140, 0, 0);
            geometryNodeB.opacity = 0;
            [geometryNodeA addChildNode:geometryNodeB];
            
            // Arrow from "Node B" to the new geometry
            SCNNode *arrowNode = [SCNNode node];
            arrowNode.geometry = [SCNShape shapeWithPath:[NSBezierPath asc_arrowBezierPathWithBaseSize:NSMakeSize(55, 3) tipSize:NSMakeSize(10, 14)  hollow:4 twoSides:NO] extrusionDepth:0];
            arrowNode.position = SCNVector3Make(0, 75, 0);
            arrowNode.rotation = SCNVector4Make(0, 0, 1, -M_PI * 0.5);
            arrowNode.geometry.firstMaterial.diffuse.contents = _purpleColor;
            [geometryNodeB addChildNode:arrowNode];
            
            // Arrow from the new geometry to "Material"
            arrowNode = [SCNNode node];
            arrowNode.name = @"arrow-shared-material";
            arrowNode.geometry = [SCNShape shapeWithPath:[NSBezierPath asc_arrowBezierPathWithBaseSize:NSMakeSize(140, 3) tipSize:NSMakeSize(10, 14)  hollow:4 twoSides:YES] extrusionDepth:0];
            arrowNode.position = SCNVector3Make(-130, -80, 0);
            arrowNode.rotation = SCNVector4Make(0, 0, 1, M_PI * 0.12);
            arrowNode.geometry.firstMaterial.diffuse.contents = _redColor;
            [geometryNodeB addChildNode:arrowNode];
            
            // Reveal
            [SCNTransaction begin];
            [SCNTransaction setAnimationDuration:1];
            {
                geometryNodeB.opacity = 1.0;
                oldArrowNode.opacity = 0.0;
                
                // Show the related code
                [self.textManager addEmptyLine];
                [self.textManager addCode:
                 @"// Unshare geometry \n"
                 @"nodeB.geometry = [nodeB.geometry #copy#];"];
            }
            [SCNTransaction commit];
            break;
        }
        case 3:
        {
            SCNNode *materialANode = [self.contentNode childNodeWithName:@"material" recursively:YES];
            SCNNode *oldArrowNode = [self.contentNode childNodeWithName:@"arrow-shared-material" recursively:YES];
            
            // New "Material" box
            SCNNode *materialBNode = [SCNNode asc_boxNodeWithTitle:@"Material" frame:NSMakeRect(-55, -20, 110, 40) color:[NSColor orangeColor] cornerRadius:10 centered:YES];
            materialBNode.position = SCNVector3Make(140, 0, 0);
            materialBNode.opacity = 0;
            [materialANode addChildNode:materialBNode];
            
            // Arrow from the unshared geometry to the new material
            SCNNode *arrowNode = [SCNNode node];
            arrowNode.geometry = [SCNShape shapeWithPath:[NSBezierPath asc_arrowBezierPathWithBaseSize:NSMakeSize(55, 3) tipSize:NSMakeSize(10, 14)  hollow:4 twoSides:NO] extrusionDepth:0];
            arrowNode.position = SCNVector3Make(0, 75, 0);
            arrowNode.rotation = SCNVector4Make(0, 0, 1, -M_PI * 0.5);
            arrowNode.geometry.firstMaterial.diffuse.contents = [NSColor orangeColor];
            [materialBNode addChildNode:arrowNode];
            
            // Reveal
            [SCNTransaction begin];
            [SCNTransaction setAnimationDuration:1];
            {
                materialBNode.opacity = 1.0;
                oldArrowNode.opacity = 0.0;
            }
            [SCNTransaction commit];
            break;
        }
    }
}

// A node hierarchy that illustrates the cloning mechanism and how to unshare attributes
- (SCNNode *)cloningDiagramNode {
    SCNNode *diagramNode = [SCNNode node];
    diagramNode.position = SCNVector3Make(7, 9, 3);
    
    // "Scene" box
    SCNNode *sceneNode = [SCNNode asc_boxNodeWithTitle:@"Scene" frame:NSMakeRect(-53.5, -25, 107, 50) color:_blueColor cornerRadius:10 centered:YES];
    sceneNode.name = @"scene";
    sceneNode.scale = SCNVector3Make(0.03, 0.03, 0.03);
    sceneNode.position = SCNVector3Make(0, 4.8, 0);
    [diagramNode addChildNode:sceneNode];
    
    // "Root node" box
    SCNNode *rootNode = [SCNNode asc_boxNodeWithTitle:@"Root Node" frame:NSMakeRect(-40, -36, 80, 72) color:_greenColor cornerRadius:10 centered:YES];
    rootNode.name = @"rootNode";
    rootNode.scale = SCNVector3Make(0.03, 0.03, 0.03);
    rootNode.position = SCNVector3Make(0.05, 1.8, 0);
    [diagramNode addChildNode:rootNode];
    
    // "Node A" box
    SCNNode *nodeA = [SCNNode asc_boxNodeWithTitle:@"Node A" frame:NSMakeRect(-55, -36, 110, 50) color:_greenColor cornerRadius:10 centered:YES];
    nodeA.name = @"nodeA";
    nodeA.scale = SCNVector3Make(0.03, 0.03, 0.03);
    nodeA.position = SCNVector3Make(0, -1.4, 0);
    [diagramNode addChildNode:nodeA];
    
    // "Geometry" box
    SCNNode *geometryNode = [SCNNode asc_boxNodeWithTitle:@"Geometry" frame:NSMakeRect(-55, -20, 110, 40) color:_purpleColor cornerRadius:10 centered:YES];
    geometryNode.name = @"geometry";
    geometryNode.scale = SCNVector3Make(0.03, 0.03, 0.03);
    geometryNode.position = SCNVector3Make(0, -4.7, 0);
    [diagramNode addChildNode:geometryNode];
    
    // "Material" box
    SCNNode *materialNode = [SCNNode asc_boxNodeWithTitle:@"Material" frame:NSMakeRect(-55, -20, 110, 40) color:_redColor cornerRadius:10 centered:YES];
    materialNode.name = @"material";
    materialNode.position = SCNVector3Make(0, -7.5, 0);
    materialNode.scale = SCNVector3Make(0.03, 0.03, 0.03);
    [diagramNode addChildNode:materialNode];
    
    // Arrow from "Scene" to "Root Node"
    SCNNode *arrowNode = [SCNNode node];
    arrowNode.name = @"sceneArrow";
    arrowNode.geometry = [SCNShape shapeWithPath:[NSBezierPath asc_arrowBezierPathWithBaseSize:NSMakeSize(3, 0.2) tipSize:NSMakeSize(0.5, 0.7) hollow:0.2 twoSides:NO] extrusionDepth:0];
    arrowNode.scale = SCNVector3Make(20, 20, 1);
    arrowNode.position = SCNVector3Make(-5, 0, 8);
    arrowNode.rotation = SCNVector4Make(0, 0, 1, -M_PI_2);
    arrowNode.geometry.firstMaterial.diffuse.contents = _blueColor;
    [sceneNode addChildNode:arrowNode];
    
    // Arrow from "Root Node" to "Node A"
    arrowNode = [arrowNode clone];
    arrowNode.name = @"arrow";
    arrowNode.geometry = [SCNShape shapeWithPath:[NSBezierPath asc_arrowBezierPathWithBaseSize:NSMakeSize(2.6, 0.15) tipSize:NSMakeSize(0.5, 0.7) hollow:0.2 twoSides:YES] extrusionDepth:0];
    arrowNode.position = SCNVector3Make(-6, -38, 8);
    arrowNode.rotation = SCNVector4Make(0, 0, 1, -M_PI * 0.5);
    arrowNode.geometry.firstMaterial.diffuse.contents = _greenColor;
    [rootNode addChildNode:arrowNode];
    
    // Arrow from "Node A" to "Geometry"
    arrowNode = [SCNNode node];
    arrowNode.geometry = [SCNShape shapeWithPath:[NSBezierPath asc_arrowBezierPathWithBaseSize:NSMakeSize(2.6, 0.15) tipSize:NSMakeSize(0.5, 0.7) hollow:0.2 twoSides:NO] extrusionDepth:0];
    arrowNode.position = SCNVector3Make(-5, 74, 8);
    arrowNode.scale = SCNVector3Make(20, 20, 1);
    arrowNode.rotation = SCNVector4Make(0, 0, 1, -M_PI_2);
    arrowNode.geometry.firstMaterial.diffuse.contents = _purpleColor;
    [geometryNode addChildNode:arrowNode];
    
    // Arrow from "Geometry" to "Material"
    arrowNode = [SCNNode node];
    arrowNode.geometry = [SCNShape shapeWithPath:[NSBezierPath asc_arrowBezierPathWithBaseSize:NSMakeSize(2.7, 0.15) tipSize:NSMakeSize(0.5, 0.7) hollow:0.2 twoSides:NO] extrusionDepth:0];
    arrowNode.position = SCNVector3Make(-6, 74, 8);
    arrowNode.scale = SCNVector3Make(20, 20, 1);
    arrowNode.rotation = SCNVector4Make(0, 0, 1, -M_PI_2);
    arrowNode.geometry.firstMaterial.diffuse.contents = _redColor;
    [materialNode addChildNode:arrowNode];
    
    return diagramNode;
}

@end