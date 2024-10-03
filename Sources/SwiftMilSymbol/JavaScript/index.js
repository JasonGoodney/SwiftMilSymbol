import ms from 'milsymbol';

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
