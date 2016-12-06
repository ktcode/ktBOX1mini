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
margin_x = 0.5;
margin_y = 1;
front_x = board_x+margin_x*2;
front_y = board_y+margin_y*2;
front_z = 6;
rear_x = front_x;
rear_y = front_y;
rear_z = 3;
base_x = 2.5;
base_y = 2.5;


translate( [0, 0, 0] ){
    difference(){
        union(){
            //color( "Blue" )
            {
            cube( [front_x, front_y, panel_thick] );
            wall_x_u( 0, front_y, 0, front_z );
            wall_x_b( 0, 0, 0, front_z );
            wall_y_r( 0, 0, 0, front_z );
            wall_y_l( front_x, 0, 0, front_z );
            board_base( margin_x, margin_y, 0 );
            }
        }
        board_hole( margin_x, margin_y, 0 );
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


module pillar( x, y, z=0 ){
    translate( [x, y, z] ){
        difference(){
        cylinder( front_z-1, 2.5, 2.5, $fn=8 );
        cylinder( front_z-1+gap1, 1.2, 1.4, $fn=8 );
        }
    }
}
module board_base( x, y, z=0 ){
    translate( [x, y, z+panel_thick] ){
        pillar( base_x, base_y, z );
        pillar( board_x-base_x, base_y, z );
        pillar( base_x, board_y-base_y, z );
        pillar( board_x-base_x, board_y-base_y, z );
    }
}



module board_hole( x, y, z=0 ){
    translate( [x, y, z+panel_thick] ){
        translate( [board_x-1, board_y-18, z] )
        cube( [10, 8, 3.2] );
        translate( [board_x-1, board_y-18+1, z+3.2-gap1] )
        cube( [10, 6, 2.8+gap2] );
        translate( [board_x-1, board_y-18, z+3.2] )
        rotate( [-45, 0, 0] )
        cube( [10, sqrt(2), sqrt(2)] );
        translate( [board_x-1, board_y-18+8, z+3.2] )
        rotate( [-225, 0, 0] )
        cube( [10, sqrt(2), sqrt(2)] );
    }
}