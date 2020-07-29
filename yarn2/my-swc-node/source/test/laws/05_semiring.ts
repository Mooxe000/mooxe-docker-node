import * as fc from 'fast-check'
import * as laws from 'fp-ts-laws'

import { eqNumber } from 'fp-ts/lib/Eq'

import { fieldNumber } from 'fp-ts/lib/Field'

describe('semiring', () => {
  it('should test Semiring laws', () => {
    const seed = 1552808164540
    laws.semiring(fieldNumber, eqNumber, fc.float(), seed)
  })
})
