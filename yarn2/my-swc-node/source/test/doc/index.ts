import {
  Option
, none
, some
, fromNullable
} from 'fp-ts/lib/Option'


import { IO } from 'fp-ts/lib/IO'

import { Either, tryCatch } from 'fp-ts/lib/Either'

const random: IO<number> = () => Math.random()

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

    expect(
      findIndex(
        [1, 2, 3]
      , (i) => i === 2
      )
    )
    .toEqual(
      some(1)
    )
    expect(
      findIndex(
        [1, 2, 3]
      , (e) => e === 4
      )
    )
    .toEqual(
      none
    )

    expect(
      find(
        [1, 2, 3]
      , (e) => e > 1
      )
    )
    .toEqual(
      some(2)
    )
    expect(
      find(
        [1, 2, 3]
      , (e) => e === 4
      )
    )
    .toEqual(
      none
    )

    console.log(
      JSON.stringify(
        {
          a: 'b'
        }
      , null, 2
      )
    )
    console.log(
      parse('{ "a": "b" }')
    )

  })

})
