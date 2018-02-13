﻿class GPS {
    constructor() {
        this.options = {
            enableHighAccuracy: true
        };
    }

    get options() {
        return this._options;
    }
    set options(value) {
        this._options = value;
    }

    getLocation() {
        var result = {  };

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                //alert("lat: " + position.coords.latitude + "\nlon: " + position.coords.longitude);
                result = { "coords": position.coords.latitude, "lon": position.coords.longitude };
            }, this.posError, this.options);
        } else {
            NolocationAvaliable();
        }

        return result;
    }

    posError(position) {
        switch (position.code) {
            case 0: // Unknown Error
                this.NolocationAvaliable();
                break;
            case 1: // Permission Denied
                this.NolocationAvaliable();
                break;
            case 2: // Unable to get Position

                break;
            case 3: // Timed Out
                this.NolocationAvaliable();
                break;
            default:
                return;
                break;
        }
    }

    NolocationAvaliable() {
        alert("Location not available");
    }
}