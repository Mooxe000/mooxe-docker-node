interface Eq<A> {
  /** returns `true` if `x` is equal to `y` */
  readonly equals: (x: A, y: A) => boolean
}

function elem<A>(E: Eq<A>)
: (a: A, as: Array<A>) => boolean
{
  return (a, as) =>
    as.some(
      item => E.equals(item, a)
    )
}

type Point = {
  x: number
  y: number
}

// const eqPoint: Eq<Point> = {
//   equals:
//     (p1, p2) =>
//       p1.x === p2.x &&
//       p1.y === p2.y
// }

// const eqPoint: Eq<Point> = {
//   equals:
//     (p1, p2) =>
//       p1 === p2 ||
//       (
//         p1.x === p2.x &&
//         p1.y === p2.y
//       )
// }

import { getStructEq } from 'fp-ts/lib/Eq'

const eqNumber: Eq<number> = {
  equals: (x, y) => x === y
}

const eqPoint: Eq<Point> = getStructEq({
  x: eqNumber
, y: eqNumber
})

type Vector = {
  from: Point
, to: Point
}

const eqVector: Eq<Vector> = getStructEq({
  from: eqPoint
, to: eqPoint
})

describe('Eq', () => {

  it('base', () => {

    expect(
      elem(eqNumber)(
        1
      , [ 1, 2, 3 ]
      )
    )
    .toEqual(
      true
    )

    expect(
      elem(eqNumber)(
        4
      , [ 1, 2, 3 ]
      )
    )
    .toEqual(
      false
    )

  })

  it('eqVector', () => {

    expect(
      eqPoint.equals(
        {
          x: 1
        , y: 2
        }
      , {
          x: 1
        , y: 2
        }
      )
    )
    .toEqual(
      true
    )

    expect(
      eqVector.equals(
        {
          from: {
            x: 1
          , y: 2
          }
        , to: {
            x: 4
          , y: 6
          }
        }
      ,
        {
          from: {
            x: 1
          , y: 2
          }
        , to: {
            x: 4
          , y: 6
          }
        }
      )
    )
    .toEqual(
      true
    )

  })

})
