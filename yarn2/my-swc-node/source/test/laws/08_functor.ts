import * as fc from 'fast-check'
import * as laws from 'fp-ts-laws'

import { eqString } from 'fp-ts/lib/Eq'

import * as E from 'fp-ts/lib/Either'
import * as O from 'fp-ts/lib/Option'

import { getEither } from 'fp-ts-laws/lib/Either'
import { getOption } from 'fp-ts-laws/lib/Option'

describe('functor', () => {
  it('should test Functor laws', () => {
    laws.functor(O.option)(
      getOption, O.getEq
    )
    laws.functor(E.either)(
      arb => getEither(
        fc.string(), arb
      )
    , S => E.getEq(
        eqString, S
      )
    )
  })
})
