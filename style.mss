// Jauntful Map by Jauntful LLC is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
// http://creativecommons.org/licenses/by-nc-sa/4.0/
// Do not hesitate to contact us at hello@jauntful.com

// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';

// Common Colors //
@jtl_brown:rgb(47, 48, 43);
@jtl_gray_dark:rgb(47, 48, 43);
@jtl_gray: rgb(112, 113, 108);
@jtl_gray_light:rgb(141, 142, 136);
@jtl_gray_lighter:#d7d7d6;
@white: #fff;

@motorway:@jtl_gray_light;
@main: @jtl_gray_light;
@street: @jtl_gray_light;
@buildings: darken(@land,3%);

@land: #f4f5f5; //#F2F2EA;
@water: #91bfce;
@park: #769f4c;

Map {
  background-color:@land;
}

#landuse {
  [class='pitch'][zoom>=18] {
    ::wall {
    line-color: lighten(@park, 10);
    line-width: 3;
    line-join: round;
    line-cap: round;
    polygon-fill: lighten(@park, 10);
  }    
    ::roof {
      polygon-fill: @park;
      polygon-geometry-transform: translate(-2,-2);
      polygon-clip: false;
      [zoom>=15] {  
      line-width: 1;
      line-color: lighten(@park, 10);
      line-geometry-transform:translate(-2,-2);
      line-clip:false;
      }
    }   
  }
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
// Landcover

//@land: #f8f4f0;
//@water: #a0c8f0;
//@water_dark: #185869;  // for the inline/shadow
@crop: #eeeed4;
@grass: @park;//#e7ebd1;
@scrub: @park;//#e0e8cd;
@wood: #d4e2c6;
@snow: #f4f8ff;
@rock: #ddd;
@sand: mix(#ffd,@land,33%);




#landuse {
  [class='park'],[class="pitch"] { 
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
  ::shadow[zoom>=17] {
    polygon-clip: false;
    polygon-fill: @buildings * 0.88;
  }
  polygon-clip: false;
  polygon-fill: @buildings;
  line-color: @buildings;
  line-width: 0.5;
  [zoom>=17] {
    polygon-geometry-transform: translate(-0.5,-1.2);
    line-width: 1;
  }
}