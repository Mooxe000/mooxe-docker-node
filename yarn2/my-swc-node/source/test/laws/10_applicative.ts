import * as fc from 'fast-check'
import * as laws from 'fp-ts-laws'

import { eqString } from 'fp-ts/lib/Eq'
import { monoidString } from 'fp-ts/lib/Monoid'

import * as E from 'fp-ts/lib/Either'
import * as O from 'fp-ts/lib/Option'
import { getEither } from 'fp-ts-laws/lib/Either'
import { getOption } from 'fp-ts-laws/lib/Option'

describe('applicative', () => {
  it('should test Applicative laws', () => {
    laws.applicative(O.option)(
      getOption, O.getEq
    )
    laws.applicative(E.either)(
      arb => getEither(fc.string(), arb)
    , S => E.getEq(eqString, S)
    )
    laws.applicative(E.getValidation(monoidString))(
      arb => getEither(fc.string(), arb)
    , S => E.getEq(eqString, S)
    )
  })
})
