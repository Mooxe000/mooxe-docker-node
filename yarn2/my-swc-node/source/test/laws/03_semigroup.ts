import * as fc from 'fast-check'
import * as laws from 'fp-ts-laws'

import { eqString } from 'fp-ts/lib/Eq'

import { Semigroup } from 'fp-ts/lib/Semigroup'

describe('my semigroup instance', () => {

  it('should test Semigroup laws', () => {
    const semigroupSpace: Semigroup<string> = {
      concat: (x, y) => x + ' ' + y
    }
    laws.semigroup(
      semigroupSpace
    , eqString
    , fc.string()
    )
  })

})
