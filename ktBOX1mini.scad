//
//
// ktBOX1 mini
//
//


gap1 = 0.001;
gap2 = 0.002;


panel_thick = 2;
board_x = 70;
board_y = 45;
board_z = 4;
margin_x = 0.6;
margin_y = 1;
margin_z = 1.5;
front_x = board_x+margin_x*2;
front_y = board_y+margin_y*2;
front_z = board_z+margin_z;
rear_x = front_x;
rear_y = front_y;
rear_z = 3;
base_x = 2.5;
base_y = 2.5;
socket_x = 51.9;
socket_y = 8.5;
socket_z = 5;
cap_front_x = front_x;
cap_front_y = 11;
cap_front_z = front_z;
cap_rear_x = rear_x;
cap_rear_y = cap_front_y;
cap_rear_z = rear_z;


A = 1;
B = 1;
C = 1;
D = 1;
E = 1;


if( A ){
translate( [0, 0, 0] ){
    difference(){
        union(){
            color( "Blue" )
            {
            cube( [front_x, front_y, panel_thick] );
            wall_x_u( 0, front_y, 0, front_z );
            wall_x_b( 0, 0, 0, front_z );
            wall_y_r( 0, 0, 0, front_z );
            wall_y_l( front_x, 0, 0, front_z );
            board_base( margin_x, margin_y, 0 );
            board_band( margin_x, margin_y, 0 );
            }
        }
        board_hole( margin_x, margin_y, 0 );
    }
}
}



if( B ){
//translate( [board_x-1, 9.25, 2+gap1] )
//rotate( [0, 180, 0] )
translate( [80, 89, 0] )
rotate( [0, 0, 0] )
sw( 0, 0, 0 );
}



if( C ){
//rotate( [0, 0, 0] ){
//translate( [0, 0, front_z+panel_thick] ){
rotate( [180, 0, 0] ){
translate( [0, -115, -rear_z] ){
    difference(){
        union(){
            color( "Black" )
            {
            cube( [rear_x, rear_y, rear_z] );
            wall_x_u( 0, rear_y, 0, rear_z-panel_thick );
            wall_x_b( 0, 0, 0, rear_z-panel_thick );
            wall_y_r( 0, 0, 0, rear_z-panel_thick );
            wall_y_l( rear_x, 0, 0, rear_z-panel_thick );
            }
        }
        rear_hole( margin_x, margin_y, 0 );
        //CN1
        translate( [margin_x+(board_x-55)/2, rear_y-7, -gap1] )
        cube( [ 55, 7, 1.5] );
        //CN2
        translate( [margin_x+(board_x-55)/2, 0, -gap1] )
        cube( [ 55, 7, 1.5] );
        //left
        translate( [0, 7+panel_thick, -gap1] )
        cube( [ rear_x/2-panel_thick, rear_y-7*2-panel_thick*2, 1.5] );
        //right
        translate( [rear_x/2, 7+panel_thick, -gap1] )
        cube( [ rear_x/2, rear_y-7*2-panel_thick*2, 1.5] );
    }
}
}
}



if( D ){
//translate( [0, 51.2, 0] ){
translate( [80, 73, 0] ){
    difference(){
        union(){
            color( "Black" )
            {
            //panel
            cube( [cap_front_x, cap_front_y, panel_thick] );
            //wall
            translate( [0, cap_front_y, 0] )
            cube( [cap_front_x, panel_thick, cap_front_z+panel_thick] );
            translate( [0, -panel_thick, 0] )
            cube( [cap_front_x, panel_thick, cap_front_z+panel_thick] );
            translate( [-panel_thick, -panel_thick, 0] )
            cube( [panel_thick, cap_front_y+panel_thick*2, cap_front_z+panel_thick] );
            translate( [cap_front_x, -panel_thick, 0] )
            cube( [panel_thick, cap_front_y+panel_thick*2, cap_front_z+panel_thick] );
            //guide
            translate( [(cap_front_x-socket_x-5)/2, 0, panel_thick] )
            cube( [socket_x+5, socket_y+2.5, socket_z] );
            pillar( base_x+margin_x, 4, panel_thick, 0 );
            pillar( board_x-base_x+margin_x, 4, panel_thick, 0 );
            }
        }
        translate( [(cap_front_x-socket_x)/2, -panel_thick+1-gap1, panel_thick+board_z-5] ){
        cube( [socket_x, socket_y, socket_z+3] );
        translate( [1.8/2, -2, 0] )
        cube( [socket_x-1.8, socket_y+2+3.5, socket_z+3] );
        }
    }
}
}


if( E ){
//rotate( [0, 0, 0]){
//translate( [0, 51.2, cap_front_z+panel_thick] ){
rotate( [180, 0, 0]){
translate( [80, -110, -cap_rear_z] ){
    difference(){
        union(){
            color( "Black" )
            {
            cube( [cap_rear_x, cap_rear_y, cap_rear_z] );
            //wall
            translate( [0, cap_front_y, 0] )
            cube( [cap_rear_x, panel_thick, cap_rear_z] );
            translate( [0, -panel_thick, 0] )
            cube( [cap_rear_x, panel_thick, cap_rear_z] );
            translate( [-panel_thick, -panel_thick, 0] )
            cube( [panel_thick, cap_rear_y+panel_thick*2, cap_rear_z] );
            translate( [cap_rear_x, -panel_thick, 0] )
            cube( [panel_thick, cap_rear_y+panel_thick*2, cap_rear_z] );
            //stopper    
            translate( [(cap_front_x-socket_x)/2+2.5/2, -panel_thick, -1.3] )
            cube( [socket_x-2.5, socket_y, 1.3] );
            }
        }
        rear_hole( margin_x, margin_y+1, 0 );
    }
}
}
}







module wall_x_u( x, y, z, h ){
    translate( [x, y, z] ){
        cube( [front_x, panel_thick, h+panel_thick] );
    }
}
module wall_x_b( x, y, z, h ){
    translate( [x, y-panel_thick, z] ){
        cube( [front_x, panel_thick, h+panel_thick] );
    }
}
module wall_y_r( x, y, z, h ){
    translate( [x-panel_thick, y-panel_thick, z] ){
        cube( [panel_thick, front_y+panel_thick*2, h+panel_thick] );
    }
}
module wall_y_l( x, y, z, h ){
    translate( [x, y-panel_thick, z] ){
        cube( [panel_thick, front_y+panel_thick*2, h+panel_thick] );
    }
}



module pillar( x, y, z=0, r=0 ){
    translate( [x, y, z] ){
        rotate( [0, 0, r] ){
            difference(){
            translate( [0, 0, board_z/2] )
            cube( [10, 10, board_z], center=true );
            cylinder( board_z+gap1, 1.6, 1.6, $fn=30 );
            translate( [0, 0, board_z-(2.4+0.15)+gap1] )
            rotate( [0, 0, 90] )
            cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
            }
        }
    }
}
module board_base( x, y, z=0 ){
    translate( [x, y, z+panel_thick] ){
        pillar( base_x, base_y, z, 0 );
        pillar( board_x-base_x, base_y, z, 0 );
        pillar( base_x, board_y-base_y, z, 180 );
        pillar( board_x-base_x, board_y-base_y, z, 180 );
    }
}
module rear_pillar( x, y, z=0 ){
    translate( [x, y, z] ){
        translate( [0, 0, -gap1] )
        cylinder( rear_z-2.2+gap2, 1.5, 1.5, $fn=30 );
        translate( [0, 0, rear_z-2.2] )
        cylinder( 2.2+gap1, 3.25, 3.25, $fn=30 );
    }
}
module rear_hole( x, y, z=0 ){
    translate( [x, y, z] ){
        rear_pillar( base_x, base_y, z );
        rear_pillar( board_x-base_x, base_y, z );
        rear_pillar( base_x, board_y-base_y, z );
        rear_pillar( board_x-base_x, board_y-base_y, z );
    }
}



module board_hole( x, y, z=0 ){
    translate( [x, y, z+panel_thick+board_z] ){
        //USB
        translate( [board_x-9.5, board_y-18+0.75, z-2.5-gap1] )
        cube( [15, 6.5, 2.5+10] );
        translate( [board_x-9.5, board_y-18, z-1.5-2.5] )
        cube( [15, 8, 2.0] );
        translate( [board_x-9.5, board_y-18, z-1.5-0.5] )
        rotate( [-45, 0, 0] )
        cube( [15, sqrt(2), sqrt(2)] );
        translate( [board_x-9.5, board_y-18+8, z-1.5-0.5] )
        rotate( [-225, 0, 0] )
        cube( [15, sqrt(2), sqrt(2)] );
        //SW
        translate( [board_x-8.5-4.25, 9.25, z-4] )
        cube( [ 8.5, 3.5, 4] );
        translate( [board_x-8.5-2.25, 9.25+1.5/2, z-4-2.5] )
        cube( [ 4.5, 1.5, 2.5] );
        translate( [board_x-8.5-2.75, 9.25+1.5/2-1.4, z-4-2.5] )
        cube( [ 6.5, 4.3, 2.5] );
        translate( [board_x-8.5-2.25-4.5, 9.25+1.5/2-2.25, z-4-1.2] )
        cube( [ 14.5, 6, 2.5] );
        //CN1
        translate( [(board_x-55)/2, board_y-6.5, z-5] )
        cube( [ 55, 10, 5+10] );
        //CN2
        translate( [(board_x-55)/2, 6.5-10, z-5] )
        cube( [ 55, 10, 5+10] );
        //LED
        translate( [22, board_y-10.5, z-board_z/2-1/2+gap1] )
        cube( [3, 4, board_z+1+gap1], center=true );
    }
}



module board_band( x, y, z=0 ){
    translate( [x, y, z+panel_thick] ){
        //center
        translate( [30, 6.5, z] )
        cube( [ 2, 32, board_z] );
        //CN1
        translate( [(board_x-57)/2, board_y-6.5-1, z] )
        cube( [ 57, 10, board_z] );
        //CN2
        translate( [(board_x-57)/2, 6.5-9, z] )
        cube( [ 57, 10, board_z] );
        //LED
        translate( [22, board_y-10.5, z+board_z/2] )
        cube( [5, 6, board_z], center=true );
    }
}



module sw( x, y, z=0 ){
    rate = 0.85;
    translate( [x, y, z] ){
        difference(){
            color( "Black" )
            union(){
                cube( [13*rate, 6*rate, 1] );
                translate( [(13*rate-4*rate)/2, (6*rate-4*rate)/2*rate, 1] )
                cube( [4*rate, 4*rate, 3] );
            }
            translate( [(13*rate-2.3)/2, (6*rate-2.3)/2, 0-gap1] )
            cube( [2.3, 2.3, 2.5] );
        }
    }
}