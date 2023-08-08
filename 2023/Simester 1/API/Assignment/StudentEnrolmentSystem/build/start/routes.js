"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const Route_1 = __importDefault(require("@ioc:Adonis/Core/Route"));
Route_1.default.group(() => {
    Route_1.default.resource("/students/", "StudentEnrolesController");
}).prefix('/v1');
Route_1.default.group(() => {
    Route_1.default.post('login', 'AuthController.login');
    Route_1.default.post('register', 'AuthController.register');
    Route_1.default.group(() => {
        Route_1.default.resource("/students/Auth/", "StudentEnrolesController");
    }).middleware('auth:api');
}).prefix('/v2');
//# sourceMappingURL=routes.js.map