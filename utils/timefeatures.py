# From: gluonts/src/gluonts/time_feature/_base.py
# Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License is located at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# or in the "license" file accompanying this file. This file is distributed
# on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied. See the License for the specific language governing
# permissions and limitations under the License.

from typing import List

import numpy as np
import pandas as pd
from pandas.tseries import offsets
from pandas.tseries.frequencies import to_offset


class TimeFeature:
    def __init__(self):
        pass

    def __call__(self, index: pd.DatetimeIndex) -> np.ndarray:
        pass

    def __repr__(self):
        return self.__class__.__name__ + "()"

class SecondOfMinute(TimeFeature):
    """Minute of hour encoded as value between [-0.5, 0.5]"""

    def __call__(self, index: pd.DatetimeIndex) -> np.ndarray:
        return index.second / 59.0 - 0.5

class MinuteOfHour(TimeFeature):
    """Minute of hour encoded as value between [-0.5, 0.5]"""

    def __call__(self, index: pd.DatetimeIndex) -> np.ndarray:
        return index.minute / 59.0 - 0.5

class HourOfDay(TimeFeature):
    """Hour of day encoded as value between [-0.5, 0.5]"""

    def __call__(self, index: pd.DatetimeIndex) -> np.ndarray:
        return index.hour / 23.0 - 0.5

class DayOfWeek(TimeFeature):
    """Hour of day encoded as value between [-0.5, 0.5]"""

    def __call__(self, index: pd.DatetimeIndex) -> np.ndarray:
        return index.dayofweek / 6.0 - 0.5

class WeekdayAndWeekend(TimeFeature):
    """Hour of day encoded as value between [-0.5, 0.5]"""

    def __call__(self, index: pd.DatetimeIndex) -> np.ndarray:
        return (index.dayofweek + 1) // 6.0 - 0.5

class MinuteOfHour_index(TimeFeature):
    """Minute of hour encoded as value between [-0.5, 0.5]"""

    def __call__(self, index: pd.DatetimeIndex) -> np.ndarray:
        return index.minute


class HourOfDay_index(TimeFeature):
    """Hour of day encoded as value between [-0.5, 0.5]"""

    def __call__(self, index: pd.DatetimeIndex) -> np.ndarray:
        return index.hour


class DayOfWeek_index(TimeFeature):
    """Hour of day encoded as value between [-0.5, 0.5]"""

    def __call__(self, index: pd.DatetimeIndex) -> np.ndarray:
        return index.dayofweek


class DayOfMonth(TimeFeature):
    """Day of month encoded as value between [-0.5, 0.5]"""

    def __call__(self, index: pd.DatetimeIndex) -> np.ndarray:
        return (index.day - 1) / 30.0 - 0.5


class DayOfYear(TimeFeature):
    """Day of year encoded as value between [-0.5, 0.5]"""

    def __call__(self, index: pd.DatetimeIndex) -> np.ndarray:
        return (index.dayofyear - 1) / 365.0 - 0.5


class MonthOfYear(TimeFeature):
    """Month of year encoded as value between [-0.5, 0.5]"""

    def __call__(self, index: pd.DatetimeIndex) -> np.ndarray:
        return (index.month - 1) / 11.0 - 0.5


class WeekOfYear(TimeFeature):
    """Week of year encoded as value between [-0.5, 0.5]"""

    def __call__(self, index: pd.DatetimeIndex) -> np.ndarray:
        return (pd.Int64Index(index.isocalendar().week.astype('int64')) - 1) / 52.0 - 0.5

class SeasonOfYear(TimeFeature):
    """Season of year encoded as value between [-0.5, 0.5]"""

    def __call__(self, index: pd.DatetimeIndex) -> np.ndarray:
        #return (index.month // 3) / 3.0 - 0.5
        return (((index.month // 3) + 3) % 4) / 3.0 - 0.5

def time_features_from_frequency_str(freq_str: str) -> List[TimeFeature]:
    """
    Returns a list of time features that will be appropriate for the given frequency string.
    Parameters
    ----------
    freq_str
        Frequency string of the form [multiple][granularity] such as "12H", "5min", "1D" etc.
    """

    if freq_str == 'h2':
        freq_str = 'h'
        features_by_offsets = {
            offsets.YearEnd: [],
            offsets.QuarterEnd: [MonthOfYear],
            offsets.MonthEnd: [MonthOfYear],
            offsets.Week: [DayOfMonth, WeekOfYear],
            offsets.Day: [DayOfWeek, DayOfMonth, DayOfYear],
            offsets.BusinessDay: [DayOfWeek, DayOfMonth, DayOfYear],
            offsets.Hour: [HourOfDay, DayOfWeek, MonthOfYear],
            #offsets.Hour: [HourOfDay_index, DayOfWeek_index],
            offsets.Minute: [
                MinuteOfHour,
                HourOfDay,
                DayOfWeek,
            ],
            offsets.Second: [
                SecondOfMinute,
                MinuteOfHour,
                HourOfDay,
                DayOfWeek,
                DayOfMonth,
                DayOfYear,
            ],
        }
    elif freq_str == 'h3':
        freq_str = 'h'
        features_by_offsets = {
            offsets.YearEnd: [],
            offsets.QuarterEnd: [MonthOfYear],
            offsets.MonthEnd: [MonthOfYear],
            offsets.Week: [DayOfMonth, WeekOfYear],
            offsets.Day: [DayOfWeek, DayOfMonth, DayOfYear],
            offsets.BusinessDay: [DayOfWeek, DayOfMonth, DayOfYear],
            offsets.Hour: [HourOfDay],
            #offsets.Hour: [HourOfDay_index, DayOfWeek_index],
            offsets.Minute: [
                MinuteOfHour,
                HourOfDay,
            ],
            offsets.Second: [
                SecondOfMinute,
                MinuteOfHour,
                HourOfDay,
                DayOfWeek,
                DayOfMonth,
                DayOfYear,
            ],
        }
    elif freq_str == 'h4':
        freq_str = 'h'
        features_by_offsets = {
            offsets.YearEnd: [],
            offsets.QuarterEnd: [MonthOfYear],
            offsets.MonthEnd: [MonthOfYear],
            offsets.Week: [DayOfMonth, WeekOfYear],
            offsets.Day: [DayOfWeek, DayOfMonth, DayOfYear],
            offsets.BusinessDay: [DayOfWeek, DayOfMonth, DayOfYear],
            offsets.Hour: [HourOfDay, DayOfWeek, SeasonOfYear],
            #offsets.Hour: [HourOfDay_index, DayOfWeek_index],
            offsets.Minute: [
                MinuteOfHour,
                HourOfDay,
            ],
            offsets.Second: [
                SecondOfMinute,
                MinuteOfHour,
                HourOfDay,
                DayOfWeek,
                DayOfMonth,
                DayOfYear,
            ],
        }
    elif freq_str == 't2':
        freq_str = 't'
        features_by_offsets = {
            offsets.YearEnd: [],
            offsets.QuarterEnd: [MonthOfYear],
            offsets.MonthEnd: [MonthOfYear],
            offsets.Week: [DayOfMonth, WeekOfYear],
            offsets.Day: [DayOfWeek, DayOfMonth, DayOfYear],
            offsets.BusinessDay: [DayOfWeek, DayOfMonth, DayOfYear],
            offsets.Hour: [HourOfDay, DayOfWeek, SeasonOfYear],
            #offsets.Hour: [HourOfDay_index, DayOfWeek_index],
            offsets.Minute: [
                MinuteOfHour,
                HourOfDay,
                SeasonOfYear,
            ],
            offsets.Second: [
                SecondOfMinute,
                MinuteOfHour,
                HourOfDay,
                DayOfWeek,
                DayOfMonth,
                DayOfYear,
            ],
        }
    elif freq_str == 't3':
        freq_str = 't'
        features_by_offsets = {
            offsets.YearEnd: [],
            offsets.QuarterEnd: [MonthOfYear],
            offsets.MonthEnd: [MonthOfYear],
            offsets.Week: [DayOfMonth, WeekOfYear],
            offsets.Day: [DayOfWeek, DayOfMonth, DayOfYear],
            offsets.BusinessDay: [DayOfWeek, DayOfMonth, DayOfYear],
            offsets.Hour: [HourOfDay, DayOfWeek, SeasonOfYear],
            #offsets.Hour: [HourOfDay_index, DayOfWeek_index],
            offsets.Minute: [
                MinuteOfHour,
                HourOfDay,
            ],
            offsets.Second: [
                SecondOfMinute,
                MinuteOfHour,
                HourOfDay,
                DayOfWeek,
                DayOfMonth,
                DayOfYear,
            ],
        }
    else:
        if freq_str == 'h1':
            freq_str = 'h'
        elif freq_str == 't1':
            freq_str = 't'

        features_by_offsets = {
            offsets.YearEnd: [],
            offsets.QuarterEnd: [MonthOfYear],
            offsets.MonthEnd: [MonthOfYear],
            offsets.Week: [DayOfMonth, WeekOfYear],
            offsets.Day: [DayOfWeek, DayOfMonth, DayOfYear],
            offsets.BusinessDay: [DayOfWeek, DayOfMonth, DayOfYear],
            offsets.Hour: [HourOfDay, DayOfWeek],
            #offsets.Hour: [HourOfDay_index, DayOfWeek_index],
            offsets.Minute: [
                MinuteOfHour,
                HourOfDay,
                DayOfWeek,
            ],
            offsets.Second: [
                SecondOfMinute,
                MinuteOfHour,
                HourOfDay,
                DayOfWeek,
                DayOfMonth,
                DayOfYear,
            ],
        }

    offset = to_offset(freq_str)

    for offset_type, feature_classes in features_by_offsets.items():
        if isinstance(offset, offset_type):
            return [cls() for cls in feature_classes]

    supported_freq_msg = f"""
    Unsupported frequency {freq_str}
    The following frequencies are supported:
        Y   - yearly
            alias: A
        M   - monthly
        W   - weekly
        D   - daily
        B   - business days
        H   - hourly
        T   - minutely
            alias: min
        S   - secondly
    """
    raise RuntimeError(supported_freq_msg)


def time_features(dates, freq='h', time_feature_types=['HourOfDay','DayOfWeek']):
    time_feature_classes = {
        'SecondOfMinute': SecondOfMinute(),
        'MinuteOfHour': MinuteOfHour(),
        'HourOfDay': HourOfDay(),
        'DayOfWeek': DayOfWeek(),
        'DayOfMonth': DayOfMonth(),
        'DayOfYear': DayOfYear(),
        'MonthOfYear': MonthOfYear(),
        'WeekOfYear': WeekOfYear(),
        'SeasonOfYear': SeasonOfYear(),
        'WeekdayAndWeekend': WeekdayAndWeekend(),
    }
    time_features = np.vstack([time_feature_classes[feat](dates) for feat in time_feature_types])
    return time_features
