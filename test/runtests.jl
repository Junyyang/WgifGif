using WgifGif
using Test
using Images, FileIO, Plots

@testset "WgifGif.jl" begin
    # Write your tests here.
    @test img = load("./img/forest.jpg")
    @test img = channelview(img) .*255
    @test G1 = WgifGif.detail_enhancement(img, img, 12, 1/28, 4, "wgif")
    @test G2 = WgifGif.dehazing(img, "wgif")
    @test colorview(RGB, G2./255)
end