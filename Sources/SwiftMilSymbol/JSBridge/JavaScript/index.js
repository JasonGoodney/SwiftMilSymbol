import ms from 'milsymbol';
import { ms2525c } from "mil-std-2525";

export class MilSymbol {
    static symbol(sidc, options) {
        var sym = options ? new ms.Symbol(sidc, options) : new ms.Symbol(sidc);
        
        return {
            "sidc": sidc,
            "svg": sym.asSVG(),
            "dataURL": sym.toDataURL(),
            "metadata": sym.getMetadata(),
            "isValid": sym.isValid(),
            "options": sym.getOptions()
        };
    }
}

export class MilStd2525 {
    static milStd2525c() {
        return ms2525c;
    }
}
