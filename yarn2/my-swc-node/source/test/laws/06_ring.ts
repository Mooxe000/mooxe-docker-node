import * as fc from 'fast-check'
import * as laws from 'fp-ts-laws'

import { eqNumber } from 'fp-ts/lib/Eq'

import { fieldNumber } from 'fp-ts/lib/Field'

describe('ring', () => {
  it('should test Ring laws', () => {
    const seed = 1552808164540
    laws.ring(fieldNumber, eqNumber, fc.float(), seed)
  })
})
