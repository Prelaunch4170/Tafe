"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const Validator_1 = require("@ioc:Adonis/Core/Validator");
class StudentValidator {
    constructor(ctx) {
        this.ctx = ctx;
        this.schema = Validator_1.schema.create({
            given_name: Validator_1.schema.string({}, [Validator_1.rules.maxLength(64)]),
            last_name: Validator_1.schema.string({}, [Validator_1.rules.maxLength(64)]),
            email_address: Validator_1.schema.string({}, [Validator_1.rules.maxLength(64)])
        });
        this.messages = {};
    }
}
exports.default = StudentValidator;
//# sourceMappingURL=StudentValidator.js.map