## Endless

Bringing an end to `end`

### Block syntax without End
```julia
julia> @progn(x = 1 + 1,
              y = x/2,
              z = x^2 + y^2)
5.0

julia> z
5.0
```

### Endless Macro Definitions
```julia
@macro progn(args...) esc(Expr(:block, args...))
```
which is equivalent to
```julia
macro progn(args...)
    esc(Expr(:block, args...))
end
```
