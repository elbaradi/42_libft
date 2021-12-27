/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_itoa.c                                          :+:    :+:            */
/*                                                     +:+                    */
/*   By: tel-bara <tel-bara@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/10/29 17:27:38 by tel-bara      #+#    #+#                 */
/*   Updated: 2020/11/24 17:27:49 by tel-bara      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_exp(int base, int exp)
{
	if (exp == 0)
		return (1);
	return (base * ft_exp(base, exp - 1));
}

static int	ft_abs(int n)
{
	if (n < 0)
		return (-n);
	else
		return (n);
}

char		*ft_itoa(int n)
{
	char	*numstr;
	size_t	numlen;
	size_t	sign;

	if (n == 0)
		return (ft_strdup("0"));
	numlen = 0;
	while (n / ft_exp(10, numlen) != 0 && numlen <= 9)
		numlen++;
	sign = (n < 0) ? 1 : 0;
	numstr = ft_calloc(numlen + sign + 1, sizeof(char));
	if (!numstr)
		return (0);
	if (sign == 1)
		numstr[0] = '-';
	while (numlen > 0)
	{
		numlen--;
		numstr[sign + numlen] = ft_abs(n % 10) + '0';
		n = ft_abs(n / 10);
	}
	return (numstr);
}
