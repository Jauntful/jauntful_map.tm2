// Jauntful Map by Jauntful LLC is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
// http://creativecommons.org/licenses/by-nc-sa/4.0/
// Do not hesitate to contact us at hello@jauntful.com

// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';

// Common Colors //
@jtl_brown:#353631;
@jtl_gray_dark:#535355;
@jtl_gray: #70716c;
@jtl_gray_light:#9b9c99;
@jtl_gray_lighter:#d7d7d6;
@white: #fff;

@motorway:@jtl_gray_light;
@main: @jtl_gray_light;
@street: @jtl_gray_light;

@land: #F2F2EA;
@water: #91bfce;
@park: #769f4c;

Map {
  background-color:@land;
}

// Political boundaries //
#admin {
  line-join: round;
  line-color: darken(@land,3%);
  line-opacity: 0;
  [maritime=1] { 
    line-color: darken(@water, 3%); 
    line-opacity: 0;
  }
  // Countries
  [admin_level=2] {
    line-width: 1.4;
    [zoom>=6] { line-width: 2; }
    [zoom>=8] { line-width: 4; }
    [disputed=1] { line-dasharray: 4,4; }
  }
  // States / Provices / Subregions
  [admin_level>=3] {
    line-width: 0.4;
    line-dasharray: 10,3,3,3;
    [zoom>=6] { line-width: 1; }
    [zoom>=8] { line-width: 2; }
    [zoom>=12] { line-width: 3; }
  }
}

// Water Features //
#water {
  polygon-gamma: 0.6;
  polygon-pattern-file: url("texture.png");
 
  ::blur {
    // This attachment creates a shadow effect by creating a
    // light overlay that is offset slightly south. It also
    // create a slight highlight of the land along the
    // southern edge of any water body.
    polygon-fill: lighten(@water,5%);
    comp-op: soft-light;
    image-filters: agg-stack-blur(4,4);
    polygon-geometry-transform: translate(0,2);
    polygon-clip: false;
  }
  [zoom<=4] {polygon-fill: darken(@water,30%);}
  [zoom=5] {polygon-fill: darken(@water,25%);}
  [zoom=6] {polygon-fill: darken(@water,20%);}
  [zoom=7] {polygon-fill: darken(@water,15%);}
  [zoom=8] {polygon-fill: darken(@water,10%);}
  [zoom>=9] {polygon-fill: darken(@water,5%);}
}

#waterway {
  [type='river'],
  [type='canal'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=12] { line-width: 1; }
    [zoom>=14] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
  }
  [type='stream'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=14] { line-width: 1; }
    [zoom>=16] { line-width: 2; }
    [zoom>=18] { line-width: 3; }
  }
}

// Landuse areas //
#landuse {
  [class='park'] { 
    polygon-fill: @park; 
    [zoom<=9] {polygon-opacity: 0.2;}
    [zoom>=10] {polygon-opacity: 0.4;}
    [zoom>=11] {polygon-opacity: 0.6;}
    [zoom>=12] {polygon-opacity: 0.8;}
    [zoom>=13] {polygon-opacity: 1;}
  }
}

// Buildings //
#building {
  [zoom>=17] {
    line-width: 0.8;
    line-color: darken(@land,10%);
    line-opacity: 0.8;
  }
}