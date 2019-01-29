module Endless

export @macro

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

end # module
