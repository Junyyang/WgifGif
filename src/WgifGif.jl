module WgifGif

# Write your package code here.
export gif, wgif, rgif, detail_enhancement, getAirLight, MinFilter, dehazing

using LinearAlgebra

include("boxfilter.jl")
include("edgeaware.jl")
include("application_functions.jl")
include("wgif.jl")
include("gif.jl")

function calc_mean(I, r, N)
    return boxfilter(I, r) ./ N
end

# when self-guided: use rg = rgif(img, zeros(size(img)),3,0.5,4)
function rgif(I, p, r = 10, e = 7, iteration=4)           
    res = I;
    for i in 1:iteration
        # print("Rolling GIF iteration ", i, "...");         
        res = gif(res, p, r, e);       
    end    
    return res
end

end
