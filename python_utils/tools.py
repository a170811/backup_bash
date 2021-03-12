import time
from datetime import timedelta


class ReusableGenerator:
    """A decorator that allows a generator to become reusable.
    That is, every time you call the __iter__ method on a decorated generator, you'll
    get a fresh instance of the generator.

    Inspiration from: http://stackoverflow.com/questions/1376438/how-to-make-a-repeating-generator-in-python

    Usage:

        @ReusableGenerator
        def testGen(x):
            for i in xrange(x):
                yield i

        a = testGen(10)
        list(a)  # [1,2,3,4,5,6,7,8,9]
        list(a)  # [1,2,3,4,5,6,7,8,9]

    """

    def __init__(self, f):
        self.args = ()
        self.kwargs = {}
        self.f = f

    def __call__(self, *args, **kwargs):
        self.args = args
        self.kwargs = kwargs
        return self

    def __iter__(self):
        return self.f(*self.args, **self.kwargs)


class Timer():
    """
    Calculate the excute time

    Useage:

    with Timer(log):
        target code
    """
    def __init__(self, log='start'):
        print('\n', log, ':')
        print('-------------------------------')
    def __enter__(self):
        self.s = time.time()
    def __exit__(self, *argv):
        t = timedelta(seconds=time.time() - self.s)
        t_strs = str(t).split(':')
        if t.seconds == 0:
            t_str = f'{t_strs[-1]} sec'
        else:
            t_str = f'{t_strs[0]}h: {t_strs[1]}m: {t_strs[2]}s'
        print(f'\n\ttotal cost: {t_str}')
        print('-------------------------------')


def timeit_wrapper(func):
    def wrapper(*args, **kwargs):
        start = time.perf_counter()  # Alternatively, you can use time.process_time()
        func_return_val = func(*args, **kwargs)
        end = time.perf_counter()
        print('{0:<10}.{1:<8} : {2:<8}'.format(func.__module__, func.__name__, end - start))
        return func_return_val
    return wrapper


if '__main__' == __name__:

    print('1. Timer')
    with Timer('test'):
        for i in range(10):
            pass
    print()

    print('2. time_wrapper')
    @timeit_wrapper
    def test():
        for i in range(10):
            pass
    test()
    print()

    print('3. ReusableGenerator')
    @ReusableGenerator
    def gen(n):
        for i in range(n):
            yield i
    x = gen(10)
    print(list(x))
    print(list(x))
    print()
