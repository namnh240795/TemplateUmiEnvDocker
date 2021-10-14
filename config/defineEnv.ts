// use process.env

export default () =>
  Object.keys(process.env)
    .filter((e) => e.startsWith('APP__'))
    .reduce(
      (a, k) => ({
        ...a,
        [`process.env.${k}`]: process.env[k],
      }),
      {},
    );
