// Roads & Railways //

#tunnel { opacity: 0.5; }
#bridge { opacity: 0.5; }
#road [type = 'rail' ] { opacity: 0.5; }

#road,
#tunnel,
#bridge {
  ['mapnik::geometry_type'=2] {
    [zoom>=12] { line-color: lighten(@street,25%);}
    [zoom<=13] { line-width: 0.5; }
    [zoom>=14] { line-width: 1; line-color: lighten(@street,20%); }
    [zoom>=15] { line-width: 1.25; }
    [zoom>=16] { line-width: 1.5; }
    [zoom>=18] { line-width: 2; }

    [class='motorway'],
    [class='motorway_link'] {
      [zoom<=8] { line-width: 0; }
      [zoom>=9] { line-width: 1; line-color: lighten(@motorway,25%);}
   //   [zoom>=12] { line-width: 2; line-color: lighten(@motorway,15%);}
      [zoom>=12] { 
        ::outline { 
          opacity: 1;
          line-color: darken(@land,2%); 
          line-width: 0.5; 
        }
         line-color: @motorway; 
         line-width: 2;
      }
      [zoom>=14] { ::outline { line-width: 1; } line-width:3; }
      [zoom>=15] { ::outline { line-width: 2; } line-width:4; }
      [zoom>=16] { ::outline { line-width: 3; } line-width:5; }
      [zoom>=17] { ::outline { line-width: 4; } line-width:6; }
      [zoom>=18] { ::outline { line-width: 5; } line-width:7; }
    }
    
    [class='main'] {
      [zoom<=10] { line-opacity:0.5; line-color: lighten(@main,25%); }
      [zoom>=11] { line-width: 1; line-color: lighten(@main,25%); }
      [zoom>=13] { line-color: lighten(@main,20%); }
      [zoom>=14] { line-color: @main; }
      [zoom>=15] { line-width: 1.25; }
      [zoom>=16] { line-width:1.5; }
      [zoom>=18] { line-width: 2; }
    }
    [class='street'],
    [class='street_limited'] {
      [zoom>=12] { line-width: 0; }
      [zoom>=14] { line-width: 1; line-color: lighten(@street,25%); }
      [zoom>=15] { line-width: 1.25; line-color: lighten(@street,20%); }
      [zoom>=16] { line-width: 1.5; line-color: lighten(@street,15%); }
      [zoom>=18] { line-width: 2; }
    }
    [class='path'],
    [class='driveway'],
    [class='service'],
    [class='street_limited'] { line-dasharray: 4,1; }
  }
}

// Rail stations
#poi_label[type='Rail Station'][network!=null][scalerank=1][zoom>=10],
#poi_label[type='Rail Station'][network!=null][scalerank=2][zoom>=10],
#poi_label[type='Rail Station'][network!=null][scalerank=3][zoom>=10] {
  marker-file: url("rail/[network]-18.svg");
  marker-height: 12;
  marker-allow-overlap: false;

   [zoom>13] {
    marker-height:16;
  }
  [zoom>15] {
    marker-height:24;
    text-name: @name;
    text-face-name: 'Roboto Condensed';
    text-fill: #333;
    text-halo-fill: #fff;
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-size: 12;
    text-wrap-width: 80;
    text-placement-type: simple;
    text-dx: 11; text-dy: 11;
    text-placements: "S,N,E,W";
  }
  // text labels first come in at zoom 16
  [zoom>=16] {
      text-size: 12;
      text-halo-radius: 2;
      text-dx: 15; text-dy: 12;
      text-line-spacing:-2;
    }
}