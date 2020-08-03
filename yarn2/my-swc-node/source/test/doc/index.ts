import * as fc from 'fast-check'
import faker from 'faker'

// fc.configureGlobal({ numRuns: 10 })

import {
  Option
, none
, some
, fromNullable
} from 'fp-ts/lib/Option'

import { IO } from 'fp-ts/lib/IO'

import { Either, tryCatch } from 'fp-ts/lib/Either'

const random: IO<number> = () => faker.random.number()

// function getItem(key: string): IO<Option<string>> {
//   return () => fromNullable(localStorage.getItem(key))
// }

function findIndex<A>(
  as: Array<A>
, predicate: (a: A) => boolean
) : Option<number> {
  const index = as.findIndex(predicate)
  return index === -1
    ? none
    : some(index)
}

function find<A>(
  as: Array<A>
, predicate: (a: A) => boolean
) : Option<A> {
  return fromNullable(as.find(predicate))
}

function parse(s: string)
: Either<Error, unknown> {
  return tryCatch(
    () => JSON.parse(s)
  , reason => new Error(String(reason))
  )
}

function unique(arr: T) {
  return arr.filter(
    (c, i, a) => a.indexOf(c, 0) === i
  )
}

describe('Option', () => {

  it('Option', () => {

    expect( typeof random() )
    .toBe( 'number' )
    expect( random() )
    .toEqual( expect.any(Number) )

    expect( some(199).value )
    .toEqual( 199 )
    expect( none._tag )
    .toEqual( 'None' )
  })

  it('find_Some', () => {

    fc.assert( fc.property(
      fc.array( fc.integer(), 1, 10 )
    ,
      data => {
        const _data = unique(data)
        const j = 
          faker.random.number({
            min: 0
          , max: _data.length - 1
          })

        expect(
          findIndex(
            _data
          , i => i === _data[j]
          )
        )
        .toEqual(
          some(j)
        )

        expect(
          find(
            _data
          , i => i === _data[j]
          )
        )
        .toEqual(
          some(_data[j])
        )
      }
    ))

  })

  it('find_None', () => {

    fc.assert( fc.property(
      fc.array( fc.integer(), 1, 10 )
    ,
      data => {
        const _data = unique(data)
        const getN = () => {
          const n = faker.random.number()
          if (n in _data) {
            getN()
          }
        }

        expect(
          findIndex(
            _data
          , i => i === getN()
          )
        )
        .toEqual(
          none
        )

        expect(
          find(
            _data
          , i => i === getN()
          )
        )
        .toEqual(
          none
        )

      }
    ))
  })

    // console.log(
    //   JSON.stringify(
    //     {
    //       a: 'b'
    //     }
    //   , null, 2
    //   )
    // )

  it('Either', () => {

    console.log(
      parse('{ "a": "b" }')
    )

    console.log(
      parse('{ a: "b" }')
    )
  })

})
