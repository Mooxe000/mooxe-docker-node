import * as fc from 'fast-check'
import * as laws from 'fp-ts-laws'

import { eqNumber } from 'fp-ts/lib/Eq'

import { monoidSum } from 'fp-ts/lib/Monoid'

describe('monoid', () => {
  it('should test Monoid laws', () => {
    laws.monoid(monoidSum, eqNumber, fc.float())
  })
})
