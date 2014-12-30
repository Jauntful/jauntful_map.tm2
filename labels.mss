// Places //

#country_label[zoom>=3][zoom<=4] {
  text-name: @name;
  text-face-name: 'Roboto Bold Condensed';
  text-transform: uppercase;
  text-wrap-width: 100;
  text-wrap-before: true;
  text-fill: @jtl_gray;
  text-halo-fill: @land;
  text-size: 18;
  text-halo-radius: 3;
  [zoom>=3][scalerank=1],
  [zoom>=4][scalerank=2] {
    text-size: 22;
    text-halo-radius: 5;
  }
  [zoom>=4][scalerank=1] {
    text-size: 24;
    text-halo-radius: 6;
  }
}

#country_label_line {
  line-color: darken(@land,3%);
  line-opacity: 0.05;
}

#place_label {
  [type='city'][zoom>=5][zoom<=14] {
    text-name: @name;
    text-face-name: 'Roboto Bold Condensed';
    text-transform: uppercase;
    text-placement:point;
    text-character-spacing: 1;
    text-fill: @jtl_gray_dark;
    text-size: 24;
    text-wrap-width: 100;
    text-wrap-before: true;
    text-halo-radius: 3;
    text-halo-fill: @land;
  }
  [type='town'][zoom<=17] {
    text-name: @name;
    text-face-name: 'Roboto Bold Condensed';
    text-transform: uppercase;
    text-fill: @jtl_gray;
    text-halo-radius: 2;
    text-halo-fill: @land;
    text-size: 14;
    text-wrap-width: 100;
    text-wrap-before: true;
    [zoom>=10] { text-size: 16; }
    [zoom>=12] { text-size: 20; }
  }
  [type='village'] {
    text-name: @name;
    text-face-name: 'Roboto Condensed';
    text-transform: uppercase;
    text-fill: @jtl_gray_light;
    text-halo-radius: 2;
    text-halo-fill: @land;
    text-size: 12;
    text-wrap-width: 100;
    text-wrap-before: true;
    [zoom>=12] { text-size: 14; }
    [zoom>=14] { text-size: 18; }
  }
  [type='hamlet'][zoom>=12],
  [type='suburb'][zoom>=12],
  [type='neighbourhood'][zoom>=12] {
    text-name: @name;
    text-face-name: 'Roboto Condensed';
    text-transform: uppercase;
    text-fill: @jtl_gray_light;
    text-placement:point;
    text-halo-radius: 2;
    text-halo-fill: @land;
    text-size: 10;
    text-wrap-width: 40;
    text-wrap-before: true;
    text-character-spacing: 2;
    text-line-spacing: 0;
    [zoom=13]{ text-size:13; text-halo-radius:2;}
    [zoom=14]{ text-size:16; text-halo-radius:3;}
    [zoom>=15]{ text-size:24;text-halo-radius:4;}
  }
}

#road_label {
[class='main'] {
    [zoom>=14] {
    text-name: @name;
    text-face-name:'Roboto Regular';
    text-fill:@jtl_gray_dark;
    text-placement: line;
    text-vertical-alignment: top;
    text-placement-type: simple;
    text-halo-radius:2.5;
    text-halo-fill:@land;
    text-min-distance:200;
    text-size:11;
    text-character-spacing: 2;
    }
    [zoom>=16] { text-size:14; }
    [zoom>=17] { text-size:15; }
    [zoom>=18] { text-size:16; }
  }
  [class='street'],
  [class='street_limited'],
  [class='service'],
  [class='driveway'],
  [class='path'] {
    [zoom>=14] {
    text-name: @name;
    text-face-name:'Roboto Light';
    text-fill:@jtl_gray_dark;
    text-placement: line;
    text-vertical-alignment: top;
    text-placement-type: simple;
    text-halo-radius:1.5;
    text-halo-fill:@land;
    text-min-distance:200;
    text-size:9;
    text-character-spacing: 1.75;
    }
    [zoom>=16] { text-size:12; }
    [zoom>=17] { text-size:13; }
    [zoom>=18] { text-size:14; }
  }
}




// Water Features //
#water_label {
  [zoom<=13],  // automatic area filtering @ low zooms
  [zoom>=14][area>500000],
  [zoom>=16][area>10000],
  [zoom>=17] {
    text-name: @name;
    text-face-name: 'Source Sans Pro Italic';
    text-fill: darken(@water, 30%);
    text-size: 13;
    text-wrap-width: 100;
    text-wrap-before: true;
  }
}

// Landuse areas //
#area_label {
  [class='park'] {
    [zoom<=13],  // automatic area filtering @ low zooms
    [zoom>=14][area>500000],
    [zoom>=16][area>10000],
    [zoom>=17] {
      text-name: @name;
      text-face-name: 'Source Sans Pro Italic';
      text-fill: darken(@park, 50%);
      text-size: 13;
      text-wrap-width: 100;
      text-wrap-before: true;
    }
  }
}
