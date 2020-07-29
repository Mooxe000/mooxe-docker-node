import * as fc from 'fast-check'
import * as laws from 'fp-ts-laws'

import { eqNumber } from 'fp-ts/lib/Eq'

describe('eq', () => {
  it('should test Eq laws', () => {
    laws.eq(eqNumber, fc.float())
  })
})
