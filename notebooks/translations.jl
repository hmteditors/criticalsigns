### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 7a617a40-5766-11eb-19c9-758c1a51ea88
begin
	import Pkg
	Pkg.activate(".")
	Pkg.add("CitableText")
	Pkg.add("PlutoUI")
	
	using CitableText
	using PlutoUI
end

# ╔═╡ e595bac4-5766-11eb-2c05-63dda7a0ce29
md"## Translation: Aristarchus *On Critical Signs*"

# ╔═╡ d8226ef6-5767-11eb-2c63-31a342bb5b26
@bind loadem Button("Load/reload data")

# ╔═╡ f6b4520c-5766-11eb-00f7-0fca095ee7a5
md"""

---

> Notebook cells to load and format data

"""

# ╔═╡ 224725fc-5767-11eb-2df6-0b79073cb4b0
function formatnode(cn::CitableNode)
	citation = "**" * passagecomponent(cn.urn) * "** " 
	section = """$(citation)  $(cn.text)
	
"""
	section
end

# ╔═╡ 37748ef2-5766-11eb-1c34-af53ff475db8
reporoot = dirname(pwd())

# ╔═╡ b26f8158-5765-11eb-1acb-3bf6b72a00fb
textdata = begin 
	loadem
	f = open(reporoot * "/translations/aristonicus.cex");
	lines = readlines(f)
	close(f)
	splits = map(ln -> split(ln,"|"), lines)
	
end


# ╔═╡ b6f07a2e-5766-11eb-0f08-4f3bca0556cb
citablenodes = map(ln -> CitableNode(CtsUrn(ln[1]), ln[2]), textdata)

# ╔═╡ 178e23ae-5767-11eb-23dc-594540018241
begin 
	cellout = []
	for n in citablenodes
		push!(cellout, formatnode(n))
	end
	Markdown.parse(join(cellout,"\n"))
end

# ╔═╡ Cell order:
# ╟─7a617a40-5766-11eb-19c9-758c1a51ea88
# ╟─e595bac4-5766-11eb-2c05-63dda7a0ce29
# ╟─d8226ef6-5767-11eb-2c63-31a342bb5b26
# ╟─178e23ae-5767-11eb-23dc-594540018241
# ╟─f6b4520c-5766-11eb-00f7-0fca095ee7a5
# ╟─224725fc-5767-11eb-2df6-0b79073cb4b0
# ╟─37748ef2-5766-11eb-1c34-af53ff475db8
# ╟─b26f8158-5765-11eb-1acb-3bf6b72a00fb
# ╟─b6f07a2e-5766-11eb-0f08-4f3bca0556cb
