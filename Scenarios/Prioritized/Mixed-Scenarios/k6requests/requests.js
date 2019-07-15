import http from "k6/http";
import { check } from "k6";
import encoding from "k6/encoding";

var counter = 999;

export default function() {
    var baseUrl = "http://3.13.175.205/";

    // Register User
    let paramsJson = {
        headers: { "Content-Type": "application/json" },
    };

    let usernameC = "testuser" + makeid(counter).toString();
    let emailaddressC = "test" + makeid(counter).toString() + "@test.de";

    var payload = JSON.stringify({ username: usernameC, password: "testpassword", email: emailaddressC });
    let userobject = http.post(baseUrl.concat("register"), payload, paramsJson);
    let user = JSON.parse(userobject.body);

    check(userobject, {
        "register is status 200": (r) => r.status === 200
    });

    let encodingCache = usernameC + ":testpassword";

    let params = { headers: { "Authorization": "Basic " + encoding.b64encode(encodingCache) , "Content-Type": "application/json" }};

    // Login User
    let res = http.get(baseUrl.concat("login"), params);

    check(res, {
        "login is status 200": (r) => r.status === 200
    });

    // Get Catalogue
    res = http.get(baseUrl.concat("catalogue"), params);

    check(res, {
        "catalogue is status 200": (r) => r.status === 200
    });

    // Get item from Catalogue
    res = http.get(baseUrl.concat("catalogue/a0a4f044-b040-410d-8ead-4de0446aec7e"), params);

    check(res, {
        "item is status 200": (r) => r.status === 200
    });

    // Add address to user
    payload = JSON.stringify({street: "Schleissheimerstraße", number: "127", country: "Germany", city: "Munich", postcode: "80804", userID: user.id});
    res = http.post(baseUrl.concat("addresses"), payload, params);

    check(res, {
        "address post is status 200": (r) => r.status === 200
    });

    // Get Customer Addres
    res = http.get(baseUrl.concat("addresses"), params);

    check(res, {
        "address get is status 200": (r) => r.status === 200
    });

    counter++;
};

function makeid(length) {
    var result           = '';
    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}


