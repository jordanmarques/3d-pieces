
rotate([180,0,0])
scale(v= [-0.6,-0.6,-0.6]){
    
    BuildPiece(holeHeight=9, holeRadius=7, connectorRadius=9, horizontalLeggsLength=7, verticalLeggsLength=13);
}

module BuildPiece(holeHeight, holeRadius, connectorRadius, horizontalLeggsLength, verticalLeggsLength){
    
    Connector(holeRadius, holeHeight, connectorRadius);
    translate([0, horizontalLeggsLength+connectorRadius - ((connectorRadius-holeRadius)/2) , holeHeight/2])
    Leggs(horizontalLeggsLength, verticalLeggsLength, holeRadius/2.5);
}


module Leggs(verticalLength, horizontalLength, radius){
    union() {
        rotate([90,0,0])
        cylinder(r=radius, h=verticalLength, center=false, $fn=100);
        translate([0, verticalLength/4 -radius, radius])
        rotate([180,0,0])
        cylinder(r=radius, h=horizontalLength, center=false, $fn=100);
    }

}


module Connector(holeRadius=2, holeHeight=10, radius){
    rotate([180,0,0])
    difference(){

        translate([0,0,-holeHeight])
        linear_extrude(height = holeHeight + (holeHeight*0.1) , center = false)
        circle(r = radius, $fn=100);
        
        translate([0,0,-holeHeight])
        linear_extrude(height = holeHeight, center = false)
        circle(r = holeRadius, $fn=100);
    }
}