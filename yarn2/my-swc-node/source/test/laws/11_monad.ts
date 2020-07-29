import * as laws from 'fp-ts-laws'

import { eqString } from 'fp-ts/lib/Eq'

import {
  monoidString
} from 'fp-ts/lib/Monoid'
import * as E from 'fp-ts/lib/Either'
import * as O from 'fp-ts/lib/Option'

describe('monad', () => {
  it('should test Monad laws', () => {
    laws.monad(O.option)(O.getEq)
    laws.monad(E.either)(S => E.getEq(eqString, S))
    laws.monad(E.getValidation(monoidString))(S => E.getEq(eqString, S))
  })
})
