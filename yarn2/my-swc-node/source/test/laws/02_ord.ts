import * as fc from 'fast-check'
import * as laws from 'fp-ts-laws'

import { ordNumber } from 'fp-ts/lib/Ord'

describe('ord', () => {
  it('should test Ord laws', () => {
    laws.ord(ordNumber, fc.float())
  })
})
