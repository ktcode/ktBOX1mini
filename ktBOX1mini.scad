//
//
// ktBOX1 mini
//
//

gap1 = 0.001;
gap2 = 0.002;

panel_thick = 2;
front_x = 70+panel_thick*2;
front_y = 45+panel_thick*2;
front_z = 5+panel_thick;
rear_x = front_x;
rear_y = front_y;
rear_z = 3+panel_thick;


translate( [0, 0, 0] ){
    cube( [front_x, front_y, panel_thick] );
}

