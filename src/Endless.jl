module Endless

export @macro, @block

macrodef =
    Expr(
        :macro,
        Expr(
            :call,
            :macro,
            :sig,
            :body
        ),
        Expr(
            :block,
            Expr(
                :quote,
                Expr(
                    :macro,
                    Expr(
                        :call,
                        Expr(
                            :$,
                            Expr(
                                :call,
                                :esc,
                                Expr(
                                    :ref,
                                    Expr(
                                        :.,
                                        :sig,
                                        QuoteNode(:args)
                                    ),
                                    1
                                )
                            )
                        ),
                        Expr(
                            :$,
                            Expr(
                                :...,
                                Expr(
                                    :ref,
                                    Expr(
                                        :.,
                                        :sig,
                                        QuoteNode(:args)
                                    ),
                                    Expr(
                                        :call,
                                        :(:),
                                        2,
                                        :end
                                    )
                                )
                            )
                        ),
                    ),
                    Expr(
                        :block,
                        Expr(
                            :$,
                            :body
                        )
                    )
                )
            )
        )
    )
eval(macrodef)

"""
    progn(args...)

Block syntax without `end`. Works the same as `begin ... end` blocks.

Expamples
```julia-repl
julia> @progn(x = 1 + 1,
              y = x/2,
              z = x^2 + y^2)
5.0

julia> z
```
"""
@macro progn(args...) esc(Expr(:block, args...))

end # module
