using Toybox.WatchUi as Ui;
using Toybox.Math as Math;

class CompassPointHeadingView extends Ui.SimpleDataField {

    function initialize() {
    	Ui.SimpleDataField.initialize();
        label = "Heading";
    }

    function compute(info) {
        var heading = info.currentHeading;
        if (heading != null) {
            var pts = radToPoints(heading);
            return pointsToCompassPoint(pts);
        }
        return "";
    }

    function radToPoints(rad) {  // Convert to 16ths of a circle, rounded to nearest
		var pts = rad * 8 / Math.PI;
        pts += 0.5;
		if (pts < 0) {
		    pts += 16.0;
		}
		return pts.toNumber();
	}

    function pointsToCompassPoint(pts) {
        switch (pts) {
            case 0:
                return "N";
            case 1:
                return "NNE";
            case 2:
                return "NE";
            case 3:
                return "ENE";
            case 4:
                return "E";
            case 5:
                return "ESE";
            case 6:
                return "SE";
            case 7:
                return "SSE";
            case 8:
                return "S";
            case 9:
                return "SSW";
            case 10:
                return "SW";
            case 11:
                return "WSW";
            case 12:
                return "W";
            case 13:
                return "WNW";
            case 14:
                return "NW";
            case 15:
                return "NNW";
            default:
                return "ERR";
        }
    }
}